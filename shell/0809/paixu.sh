#! /bin/bash
read -t 30 -p  "请输入要比较的个数：" num
n=0
for a in `seq 0 $[$num-1]`
do
   read -t30 -p "第"$[$a+1]"个数为:" an 
   arr[$a]=$an
done
echo "该组数为："
echo ${arr[*]}  
len=$num
for((i=0;i<len;i++))  
do
    for((j=0;j<len-i-1;j++))
    do  
        J=$[$j+1]   
        if [[ ${arr[$j]}  -lt ${arr[$J]} ]]  
        then
              term=${arr[$j]}
              arr[$j]=${arr[$J]}
              arr[$J]=$term
        fi
    done
done

echo "从大到小排序顺序为："
for((k=0;k<len;k++))
do
    echo -n  "${arr[$k]} "
done
echo
