#!/bin/bash


read -t 30 -p "其需要添加几个用户?" num
for i in `seq 1 $num`
do
   read -p "第$i 个用户为：" usr
   arr[$[$i-1]]=$usr
done
#echo ${arr[*]}
for j in `seq 0 $[$num-1]`
do
   if ! id ${arr[$j]} &>/dev/null;then
      useradd  ${arr[$j]}
      ps=$(cat /dev/urandom |tr -dc [:alnum:] |head -c 8)
      echo "$ps" | passwd --stdin ${arr[$j]}
      if [ $? -eq 0 ];then
         echo "用户创建成功！密码为“$ps”"
      else echo "密码更新失败，请手动更新"
      fi
   else echo "用户${arr[$j]} 已存在！"
   fi


done
