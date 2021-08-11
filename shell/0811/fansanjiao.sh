#!/bin/bash

read -p "行数" n
for i in `seq 1 $n`
do
   for((kong=1;kong<i;kong++))
   do
      echo -n " "
   done
   for((xing=1;xing<=((n+1-i)*2-1);xing++))
   do
      echo -n "*"
   done

echo
done
