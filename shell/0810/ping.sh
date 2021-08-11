#!/bin/bash


for i in `seq 128 138`
do
   {
    if ping -c 1 -w 1 192.168.210.$i &>/dev/null; then
        echo "192.168.210.$i 已开机！"
   else echo "192.168.210.$i 未开机！"
   fi
   }&
done
wait
