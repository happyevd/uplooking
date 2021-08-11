#!/bin/bash


for((i=1;i<10;i++))
do
   for((j=1;j<i+1;j++))
   do  
       num=$[$j*$i]
       echo -n -e "$j*$i=$num \t"
   done


   echo
done

