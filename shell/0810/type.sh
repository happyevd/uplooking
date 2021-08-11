#!/bin/bash

read -t 30 -p "请输入：" s
if [[ -z "$s" ]];then 
   echo "空字符"
   exit 1
elif [ -z $(echo $s | tr -d [a-zA-Z]) ];then
   echo "字母"
   exit 2
elif [ -z $(echo $s | tr -d [0-9]) ];then
   echo "数字"
   exit 3
elif [ -z $(echo $s | tr -d [a-zA-Z0-9]) ];then
   echo "数字加字母"
   exit 4
else echo "字符" 
     exit 5
fi
