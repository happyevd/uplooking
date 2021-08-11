#!/bin/bash

echo "仅支持同网段ip与外网"
read -t 30 -p "请输入需要检测的ip地址：" pi

ping $pi -c 2  &>/dev/null

if [ $? -ne 0 ]; then
    echo "该设备处于关机状态！"
else echo "该设备已开机！"
fi
