#!/bin/bash


echo "- - -">/sys/class/scsi_host/host0/scan 
echo "- - -">/sys/class/scsi_host/host1/scan 
echo "- - -">/sys/class/scsi_host/host2/scan 

dv=$(lsblk | tail -2 | head -1|awk '{print $1}' )
pvcreate /dev/$dv
read -t 30 -p "请输入要创建的VG名" VG
if [ -z $VG  ]; then
   echo "VG名不能为空！"
   exit 1
fi
      read -t 30  -p "请输入允许创建的最大逻辑卷数，格式为‘-l 数值’ 不需要则跳过" $vl 
      read -t 30  -p "请输入允许添加的最大物理卷数，格式为‘-p 数值’ 不需要则跳过" $vp 
      read -t 30  -p "请输入指定pe大小，格式为‘-s 数值’ 默认为4M" $vs 
      vgcreate $v1 $vp $vs $VG /dev/$dv
	
      read -t 30 -p "请输入要创建的lv卷" lv
         if [ -z $lv ];then
             echo "lv名不能为空！"
             exit 2
         fi
         read -t 30  -p "请指定逻辑块数量/大小，格式为‘-l 数值/-L 数值’ " $ll
         if [ -z $ll ]; then
             echo "该值不能为空！"
             exit 3
	 fi
  	 lvcreate $ll -n $lv /dev/$VG
             if [ $? -eq 0 ]; then
                echo "逻辑卷创建完毕！"
             else "创建失败"
             fi

