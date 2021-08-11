#!/bin/bash

z=5
for((i=0;i<5;i++))
do
   for((j=0;j<5;j++))
    do  
      if [ $j -ge $[5-i-1] ]; then
            echo -n "*"
      else
            echo -n " " 
      fi  
   done
echo
done

