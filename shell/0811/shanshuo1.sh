#!/bin/bash
read -p "请输入要打印的三角形的行数: " n
for i in `seq 1 $n`;do
   for ((kong=(n-i);kong>0;kong--));do
      echo -n -e  "\033[3"$[RANDOM%6+1]"m \033[05m"
   done
   for((xing=1;xing<=(i*2-1);xing++));do
      echo -n -e  "\033[3"$[RANDOM%6+1]"m*\033[05m"
   done
echo
done
      echo -n -e  "\033[3"$[RANDOM%6+1]"m\033[0m"
