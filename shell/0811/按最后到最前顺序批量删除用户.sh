#!/bin/bash

echo "从最近到最老顺序删除"
read -p "删除多少个用户？" n
for i in `cat /etc/passwd | awk -F : '{print $1}' |tail -$n`
do
  if id $i  &>/dev/null; then
   userdel -r $i &>/dev/null
   echo "用户$i 已删除！"
  else
   echo "用户$i 不存在！"
  fi
done
