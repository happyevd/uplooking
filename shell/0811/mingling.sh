#!/bin/bash

cat<<eof
*******************
     请选择
输入1：运行ls命令
输入2：运行id命令
输入3：运行who命令
输入4：运行ll命令
输入0：退出
*******************
eof
 
read -p "请输入选项:" n
while true
do
   case $n in
   1)
   echo -e "\e[32m执行ls命令\e[0m"
   ls
   ;;
   2)
   echo -e "\e[32m执行id命令\e[0m"
   id
   ;;
   3)
   echo -e "\e[32m执行who命令\e[0m"
   who
   ;;
   4)
   echo -e "\e[32m执行ll命令\e[0m"
   ls -l
   ;;
   0)
   echo -e "\e[32m已退出\e[0m！"
   exit 1
   ;;
   *)
   echo -e "\e[31m请重新输入\e[0m" 
   ;;
esac
echo -n -e "\e[32m回车继续\e[0m"
read -t 60 -p ":" s
clear
cat<<eof
*******************
     请选择
输入1：运行ls命令
输入2：运行id命令
输入3：运行who命令
输入4：运行ll命令
输入0：退出
*******************
eof
read -p "请选择命令:" n
done



