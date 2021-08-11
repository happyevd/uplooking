#bin/bash

read -t 30 -p "用户名前缀:" us
read -t 30 -p "需要创建几个用户:" n
for i in `seq 1 $n`
do
   if ! id $us$i &>/dev/null;then
      useradd $us$i  &>/dev/null
      ps=$(cat /dev/urandom |tr -dc [:alnum:] |head -c 8)
      echo "$ps" | passwd --stdin $us$i &>/dev/null
      echo "用户$us$i 创建成功!"
      echo "密码为：$ps"
   else
      echo "用户$us$i 已存在！"
   fi


done
