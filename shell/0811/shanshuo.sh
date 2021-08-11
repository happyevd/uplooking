#!/bin/bash


read -t 30 -p "请输入高度：" n
for((i=1;i<=$n;i++))
do
   for((k=n-i;k>0;k--))
   do
      echo -n " "
   done
   for((j=1;j<=(i*2-1);j++))
   do
      echo -n "*"
   done


echo
done
