#!/bin/bash

read  -t 15 -p "请输入第一个数:" a
read  -t 15 -p "请输入第二个数:" b
read  -t 15 -p "请输入第三个数:" c

if [ $a -lt $b ]; then
   num=$a
   a=$b
   b=$num
   if [ $a -lt $c ]; then
      num=$a
      a=$c
      c=$num 
   fi
   if [ $b -lt $c ]; then
            num=$b
            b=$c
            c=$num
   fi
     
elif [ $a -lt $c ]; then
      num=$a
      a=$c
      c=$num
   
         if [ $b -lt $c ]; then
            num=$b
	    b=$c
	    c=$num
         fi
else 
   if [ $b -lt $c ]; then
            num=$b
            b=$c
            c=$num
   fi  

fi
echo $a $b $c
