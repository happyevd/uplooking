#!/bin/bash

read -t15  -p "请输入一个年份:" year
n=$[$year % 100]
u=$[$year % 4]
m=$[$year % 400]
if [[ $n -eq 0 || $u -eq 0 || $m -eq 0 ]]; then
   echo "$year 为闰年"
else
   echo "$year 不为闰年"
fi
