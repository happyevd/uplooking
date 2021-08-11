#/bin/bash

read -p "请输入要创建的账号名：" username
if [ -z $username ]; then
   echo "请输入用户名！"
   exit 20
fi
id $username &>/dev/null
if [ $? -eq 0  ]; then
   echo "用户已存在"
   exit 21
fi
read -p "请定义UID，格式为'-u ID',无则跳过：" $u
read -p "请定义GID，格式为'-g GID',无则跳过：" $g
read -p "请定义附加组ID 格式为'-G 附加组id'：" $G
read -p "是否需要创建家目录，不需要则输入'-M',需要直接跳过：" $M
read -p "请定义用户shell，默认则跳过：" $S

useradd $u $g $G $M $S $username
if [ $? -ne 0 ]; then 
   echo "$username 用户创建失败"
   echo "请检查您的参数"
   echo "$u $g $G $M $S"
else echo "$username 用户创建成功！"
fi


if [ $? -eq 0 ]; then
p=qwe
while ( [ $p != y ] || [ $p != n ] )
do
read -p "是否需要特殊字符？（y/n）：" p
if [ $p == y ];then
   read -r -s -t 15 -p "请输入密码，默认为‘123456’:" pw
   if [ -z $pw ];then
      echo "123456" | passwd --stdin $username
      echo "已使用默认密码‘123456’"
      exit 10
   fi
   echo $pw | passwd --stdin $username
   break
elif [ $p == n ]; then
   read -r -s -t 15 -p "请输入密码，默认为‘123456’:" pw
   if [ -z $pw ];then
      echo "123456" | passwd --stdin $username
      echo "已使用默认密码‘123456’"
      exit 10
   fi
   echo $pw | passwd --stdin $username
   break
else 
   echo "请重新选择"
   continue
fi
done
else exit 9
fi
