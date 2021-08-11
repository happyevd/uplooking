#!/bin/bash

read -t15 -p "请输入成绩:" S
if ( [ $S -ge 80 ] && [ $S -le 100 ] ); then
  echo "该成绩优秀！"
elif ( [ $S -ge 60 ] && [ $S -lt 80  ] ); then
   echo "该成绩良好！"
elif ( [ $S -ge 0 ] && [ $S -lt 60 ] ); then
   echo "该成绩不及格！"
else echo "输入的成绩不符合规范，请重新输入！"
fi
