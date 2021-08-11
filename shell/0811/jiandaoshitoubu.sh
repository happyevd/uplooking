#!/bin/bash

echo  -e "\e[31m输入 “退出或exit” 退出游戏\e[0m"
read -t 30 -p "请您猜拳（剪刀/石头/布）：" p
until [ "$p" == '剪刀' ] || [ "$p" == '石头' ] || [ "$p" == '布' ]
do
if [ "$p" == '退出' ] || [ "$p" == exit ];then
   echo "已退出"
   exit 1
elif [ "$p" != '剪刀' ] || [ "$p" != '石头' ] || [ "$p" != '布' ];then
   echo "输入不符合规则，请重新输入！"
fi
   read -t 30 -p "请您猜拳（剪刀/石头/布）：" p
done

i=1       ##统计正常对局局输
j=1       ##统计所有对局输
win=0     ##统计胜局
lose=0    ##统计败局
draw=0    ##统计平局
other=0   ##统计不符合规范局
while true
do
num=$[RANDOM%3+1]
if [ $num -eq 1  ];then
   str="剪刀"
   echo "电脑为 ‘剪刀’ "
elif [ $num -eq 2 ];then
   str="石头"
   echo "电脑为 ‘石头’"
elif [ $num -eq 3 ];then
   str="布"
   echo "电脑为 ‘布’"
fi
case $p in
   剪刀)
   if [ $p == 剪刀 ];then
      if [ $str == 剪刀  ];then
         echo "平局！"
         f=d
         read -t 30 -p "请您猜拳（剪刀/石头/布）：" p
      elif [ $str == 石头 ];then
         echo "您输了!"
         f=l 
         read -t 30 -p "请您猜拳（剪刀/石头/布）：" p
      else
         echo "您赢了！"
         f=w
         read -t 30 -p "请您猜拳（剪刀/石头/布）：" p
      fi
   fi
   ;;
   石头)
   if [ $p == 石头 ];then
      if [ $str == 剪刀  ];then
         echo "您赢了！"
         f=w
         read -t 30 -p "请您猜拳（剪刀/石头/布）：" p
      elif [ $str == 石头 ];then
         echo "平局"
         f=d 
         read -t 30 -p "请您猜拳（剪刀/石头/布）：" p
      else
         echo "您输了！"
         f=l
         read -t 30 -p "请您猜拳（剪刀/石头/布）：" p
      fi
   fi
   ;;
   布)
   if [ $p == 布 ];then
      if [ $str == 剪刀  ];then
         echo "您输了！"
         f=l
         read -t 30 -p "请您猜拳（剪刀/石头/布）：" p
      elif [ $str == 石头 ];then
         echo "您赢了！" 
         f=w
         read -t 30 -p "请您猜拳（剪刀/石头/布）：" p
      else
         echo "平局！"
         f=d
         read -t 30 -p "请您猜拳（剪刀/石头/布）：" p
      fi
   fi   
   ;;
   退出|exit)
   echo "已退出"
   f=e
   break
   ;;
   *)
   read -t 30 -p "输入错误，请重新输入:" p
   f=o
   i=$[$i-1]
   ;;
esac
if [  $f == w  ];then
   win=$[$win+1]
elif [ $f == l ];then
   lose=$[$lose+1]
elif [ $f == d ];then
   draw=$[$draw+1]
elif [ $f == o ]; then
   other=$[$other+1]
fi



i=$[$i+1]
j=$[$j+1]
done
echo "共进行$[$j-1] 局游戏"
echo "其中："
echo "有效对局$[$i-1] 局"
echo -e "\033[32m赢$win 局 \033[0m"   
echo -e "\033[31m输$lose 局 \033[0m"
echo -e "\033[34m平$draw 局\033[0m"
echo -e "\033[33m不符合规范$other 局 \033[0m"
s=$(awk 'BEGIN{printf "%.2f%\n",('$win'/'$[$i-1]')*100}')
echo "您的胜率为$s"
 #  if [ $p == 剪刀 ];then
  #    if [ $str == 剪刀  ];then
   #      echo "平局！"
#	 read -t 30 -p "请您猜拳（剪刀/石头/布）：" p
 #     elif [ $str == 石头 ];then
  #       echo "您输了!" 
   #      read -t 30 -p "请您猜拳（剪刀/石头/布）：" p
    #  else 
     #    echo "您赢了！"
      #   break
#      fi
 #  fi
  # if [ $p == 石头 ];then
   #   if [ $str == 剪刀  ];then
    #     echo "您赢了！"
#	 break
 #     elif [ $str == 石头 ];then
  #       echo "平局" 
   #      read -t 30 -p "请您猜拳（剪刀/石头/布）：" p
    #  else 
     #    echo "您输了！"
#	 read -t 30 -p "请您猜拳（剪刀/石头/布）：" p
 #     fi
  # fi
   #if [ $p == 布 ];then
    #  if [ $str == 剪刀  ];then
     #    echo "您输了！"
      #   read -t 30 -p "请您猜拳（剪刀/石头/布）：" p
 #     elif [ $str == 石头 ];then
  #       echo "您赢了！" 
#	 break
 #     else 
  #       echo "平局！"
   #      read -t 30 -p "请您猜拳（剪刀/石头/布）：" p
    #  fi
  # fi



