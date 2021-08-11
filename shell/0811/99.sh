#!/bin/bash

i=1
j=1
while [ $i -lt 10 ]
do
   while [ $j -lt $[$i+1] ]
   do
      num=$[$i*$j]
      echo -n " $j*$i=$num"
      j=$[$j+1]
   done
echo
i=$[$i+1]
j=1
done
