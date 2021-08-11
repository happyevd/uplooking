#!/bin/bash

read -t 15 -p "请输入高度：" p 
for((i=0;i<$p;i++))
do
   for((j=0;j<$[($i+1)*2-1];j++))
   do
      if [ $[$j%2] -eq 0 ];then
         echo -n "|"
      else echo -n " " 
      fi
   done
echo  "_"
done
