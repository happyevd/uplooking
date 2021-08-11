#!/bin/bash

read -t 30 -p "请输入高度（双数）：" n
while [ $[$n%2] -ne 0 ]
do
   echo "输入数不为双数，请重新输入！"
   read -t 30 -p "请输入高度（双数）：" n
done
for((i=0;i<$n;i++))
do  
   if [ $i -lt $[$n/2] ];then  
      for((j=0;j<$i+1;j++))
      do
	  echo -n "*"
      done
   elif [ $i -gt $[$i/2] ];then
      for((j=0;j<$n-i;j++))
      do
         echo -n "*"
      done
   fi
echo 
done
