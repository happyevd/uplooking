#!/bin/bash
read -p "行数：" n
for((i=1;i<=n;i++))
do   
   for((k=0;k<n-i;k++))
   do
      echo -n " "
   done
   for((x=0;x<(2*i-1);x++))
   do
      echo -n "*"
   done
echo
done
