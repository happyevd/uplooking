#!/bin/bash

for((i=0;i<8;i++))
do 
   for((j=0;j<8;j++))
   do
   if [ $[$i%2] -eq 0 ];then
      if [ $[$j%2] -eq 0 ];then
         echo -n -e "\033[32;42m   \033[0m"
      else  echo -n -e "\033[44;34m   \033[0m"
      fi
   elif [ $[$i%2] -ne 0 ];then
      if [ $[$j%2] -ne 0 ];then
         echo -n -e "\033[44;34m   \033[0m"
      else echo -n -e "\033[32;42m   \033[0m"
      fi
   fi
   done
echo
done
