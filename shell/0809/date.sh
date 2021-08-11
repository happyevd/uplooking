#!/bin/bash
ti=$(date +%H)
if [ $ti -le 12 ];then
str="早安！ $USER"
elif [ $ti -gt 12 -a $ti -le 18 ];then
str="午安！ $USER"
else
str="晚上好！ $USER"
fi
echo  "$str"
echo "当前时间是:`date "+%F %T"`"
