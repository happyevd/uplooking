#!/bin/bash
 #使用系统函数
nginx_file_dir=/usr/local/nginx
nginx_servic=$nginx_file_dir/sbin/nginx
pid_file=$nginx_file_dir/logs/nginx.pid
proc=nginx
if [ -f  /etc/init.d/functions ];then
    . /etc/init.d/functions 
else echo "not found /etc/init.d/functions"
      exit 1
fi
if [ -f $pid_file ];then
   nginx_pid=`cat $pid_file`
   nginx_proc_num=$(ps aux |grep $nginx_pid |grep -v "grep" | wc -l)
fi
start () {
   if [ -f $pid_file ] && [ $nginx_proc_num -ge 1 ];then
      echo "nginx running!"
   elif [ -f $pid_file ] && [ $nginx_proc_num -le 1 ];then
      rm -f $pid_file
      action "nginx start" $nginx_servic   
   else 
      action "nginx start" $nginx_servic   
   fi
}

stop () {
   if [ -f $pid_file ] && [ $nginx_proc_num -ge 1 ];then
      action "nginx stop"  killall $proc 
   else 
      action "nginx stop"  killall $proc    2>/dev/null
   fi
}

restart () {
   stop
   sleep 2
   start
}

reload () {
   if [ -f $pid_file ] && [ $nginx_proc_num -ge 1 ];then
      action "nginx reload" killall -s HUP $proc
   else
      action "nginx reload" killall -s HUP $proc    2>/dev/null
   fi
}

status () {
   if [ -f $pid_file ] && [ $nginx_proc_num -ge 1 ];then
      echo "running"
   else echo "stop"
   fi
}


case $1 in
start) start ;;
stop)  stop ;;
restart) restart;;
reload)  reload;;
status)  status;;
*) echo "$0 [start|stop|restart|reload|status]"
esac
