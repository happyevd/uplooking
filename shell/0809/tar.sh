#!/bin/bash

if [ ! -d /etc.bak  ]; then 
   mkdir /etc.bak
fi

tar cf /etc.bak/etc.`date +%F`.tar.gz /etc &>/dev/null
if [ $? -ne 0 ]; then 
   echo "文件备份失败！"
else echo "文件备份成功！"
fi
find /etc.bak/*.tar.gz -mtime +28 -exec rm -f {} \;
