#！/bin/bash
DIR="$( cd "$( dirname "$0"  )" && pwd  )"
cd $DIR
###############删除无用容器###################
docker stop $(docker ps -a|grep -w 5.2.6|cut -d' ' -f1) &> /dev/null
docker rm $(docker ps -a|grep -w 5.2.6|cut -d' ' -f1) &> /dev/null
##############创建持久化目录##################
ls -l /data/zabbix_data/ &> /dev/null
if [ $? -eq 0 ];then
 `tar -cvf zabbix_data.tar /data/zabbix_data/* &> /dev/null`
 `mv zabbix_data.tar /root/ &> /dev/null`
 `rm -rf /data/zabbix_data`
 `mkdir -p /data/zabbix_data/mysql`
 `mkdir -p /data/zabbix_data/web`
 `echo "已存在的目录已打包至/root/zabbix_data.tar"`
else
 `mkdir -p /data/zabbix_data/mysql`
 `mkdir -p /data/zabbix_data/web`
fi

#解压模板数据至持久目录
tar -xvf tar/zabbix-mysql.tar.gz -C /data/zabbix_data/mysql/ > /dev/null
tar -xvf tar/web.tar -C /data/zabbix_data/web/ > /dev/null

