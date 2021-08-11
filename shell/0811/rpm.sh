#!/bin/bash

read -t 60 -p "请输入要查询的软件包:" f
fn=`rpm -qa | grep $f`
if [ -z $fn ];then
   echo -e "\e[31m软件包未安装\e[0m"
else echo -e "\e[32m软件包已安装\e[0m"
fi
