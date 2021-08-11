#!/bin/bash


read -t 30 -p "其需要删除几个用户?" num
for i in `seq 1 $num`
do
   read -p "第$i 个用户为：" usr
   arr[$[$i-1]]=$usr
done
#echo ${arr[*]}
for j in `seq 0 $[$num-1]`
do
   if id ${arr[$j]} &>/dev/null;then
      userdel -r ${arr[$j]}
      echo "用户${arr[$j]} 已删除！"
   else echo "用户${arr[$j]} 不存在"
   fi


done
