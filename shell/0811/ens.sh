#!/bin/bash

read -t 60 -p "请输入网段：" a
if [ -z $a ];then
   echo "不可为空！"
   exit 1
fi
i=0
until [ ${#arr[*]} -ge 10 ]
do
((i++))
read -p "请输入第$[$i] 个配置文件ip最后位：" b
while [[ -z $b || $b -lt 0 || $b -gt 254 ]]
do
if [ -z $b ];then
   echo "不可为空！"
   read -p "请输入第$[$i] 个配置文件ip最后位" b
elif [[ $b -lt 0 || $b -gt 254 ]];then
   echo "不符合规范，请重新输入"
   read -p "请输入第$[$i] 个配置文件ip最后位" b
else break
fi
done
#echo $a $b
arr[$[$i-1]]=$b
done
#echo ${arr[*]}
for((i=0;i<10;i++))
do
cat>>/opt/ens/ens${arr[$i]}<<eof
TYPE="Enternet"
BOOTPROTAT='static'
DEVICE=ens${arr[$i]}
NAME=ens${arr[$i]}
ONBOOT=yes
IPADDR=$a.${arr[$i]}
NETMASK=255.255.255.0
GATEWAY=192.168.1.2
DNS1=114.114.114.114
DNS2=202.106.0.20
eof
done






