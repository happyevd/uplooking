#!/bin/bash

echo "猜数字，随机生成一个1-100的数字"
num=$[RANDOM%100+1]
i=1
read -t 30 -p "请输入一个数：" a
while true
do
   if [ $a -eq $num   ]; then
      echo "恭喜你！答对啦！"
      echo "你猜了$i 次"
      break
   elif [ $a -gt $num ]; then
      read -t 30 -p  "数字太大，请重新猜:" a
   else 
      read -t 30 -p "数字太小，请重新猜:" a
   fi
 i=$[$i+1]
done
