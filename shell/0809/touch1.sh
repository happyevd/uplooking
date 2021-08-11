#/bin/bash
echo  "请创建文件，文件名只包含英文数字"
read -t 15 -p "请输入路径（/结尾）：" l
if [ ! -d $l ]; then
   echo "$l 不是一个目录，请检查！"
   exit 1
fi
read -t 30 -p "请输入你要创建的文件名：" fn
if [ -z $fn ]; then
    echo "文件名不可为空！"
    exit 2
fi
str=$(echo "$fn" | tr -d "[a-zA-Z0-9]")
if [ -z $str ]; then
   touch $l$fn
   echo "文件$l$fn 创建完毕！"
   ft=$(stat $l$fn |grep IO |awk '{print $5}')
   echo "文件类型为$ft"
else   echo "$l$fn 不符合规范，请检查！"
fi
