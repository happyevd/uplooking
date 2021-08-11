#!/bin/bash

clear
str=$(rpm -qa | grep vsftpd)
if [ -z $str ];then
cat<<eof
*****************************************************
|   echo "检测到环境缺少必要命令包'vsftpd'需要下载" |
|   echo "输入1：切换阿里yum源并自动下载"           |
|   echo "输入2：不切换yum源，直接下载'vsftpd'包"   |
|   echo "输入其他：退出该脚本"                     |
*****************************************************
eof
   read -p "请输入：" i
case $i in
   1)
   if [ ! -d /etc/yum.repos.d/bak ]; then 
   
      mkdir /etc/yum.repos.d/bak
   
   fi
   mv /etc/yum.repos.d/*  /etc/yum.repos.d/bak  &>/dev/null
   wget -O /etc/yum.repos.d/Centos-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
   yum clean all 
   yum repolist 
   yum install -y vsftpd
   ;;
   
   2)
   yum install -y vsftpd
  if [ $? -ne 0 ]; then
     echo "当前yum源无可用'vsftpd'包，请自行下载或重开脚本选择切换阿里源"
     exit 10
  fi 
   ;;
   
   *)
   echo  "已退出！"
   exit 8
   ;;
   
esac
else echo "vsftpd已安装！"
fi

