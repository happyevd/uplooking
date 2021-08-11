#! /bin/bash
n=0
while read arr[$n] 
do
   n=$[$n+1]
done    

#echo ${arr[*]}  

len=${#arr[*]} 
 
for((i=0;i<len;i++))  
do
    for((j=0;j<len-i-1;j++))
    do  
        t=$[$j+1]   
        if [[ ${arr[$j]}  -lt ${arr[$t]} ]]  
        then
              term=${arr[$j]}
              arr[$j]=${arr[$t]}
              arr[$t]=$term
        fi
    done
done

for((k=0;k<len;k++))
do
    echo ${arr[$k]}
done  
