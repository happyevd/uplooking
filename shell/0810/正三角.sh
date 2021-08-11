#!/bin/bash

z=5
for((i=0;i<5;i++))
do
   for((j=0;j<5;j++))
    do
      if [ $j -gt $[3-i] ]; then
        
         echo -n "*"
      fi
         echo -n " " 
   done

echo

done
