#!/bin/bash


find /opt -name *.log -exec tar -rf   /opt/optlog`date +%F`.tar.gz     {} \;
if [ $? -ne 0 ]; then
   echo "打包失败!"
else echo "打包成功！"
