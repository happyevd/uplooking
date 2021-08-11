#/bin/bash
echo  "请创建文件，文件名只包含英文数字"
read -t 15 -p "请输入路径（/结尾）：" l
read -t 15 -p "请输入你要创建的文件名：" fn

str=$(echo "$fn" | tr -d "[a-zA-Z0-9]")
if [ -z $str ]; then
   touch $l$fn
   echo "文件$l$fn 创建完毕！"
   if [ -f $l$fn ]; then
      echo "该文件为普通文件"
   elif [ -d $l$fn ]; then 
      echo "该文件为目录" 
   elif [ -c $l$fn ]; then 
      echo "该文件为字符文件" 
   elif [ -b $l$fn ]; then 
      echo "该文件为块状文件" 
   elif [ -l $l$fn ]; then 
      echo "该文件为链接文件" 
   elif [ -p $l$fn ]; then 
      echo "该文件为管道文件" 
   fi
else   echo "$l$fn 不符合规范，请检查！"
fi
