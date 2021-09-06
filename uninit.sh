#!/bin/bash
#卸载server

UNSERVER(){
docker stop zabbix-web-5.2.6
docker rm zabbix-web-5.2.6
docker stop zabbix-server-5.2.6
docker rm zabbix-server-5.2.6
docker stop zabbix-java-5.2.6
docker rm zabbix-java-5.2.6
docker stop mysql-server-5.2.6
docker rm mysql-server-5.2.6
rm -rf /data/zabbix_data/mysql
echo "删除完成"
}

#卸载proxy
UNPROXY(){
docker stop $(docker ps -a |grep -w proxy) &> /dev/null
docker rm $(docker ps -a |grep -w proxy) &> /dev/null
echo "删除完成"
}

#卸载全部
UNALL(){
docker stop $(docker ps -a|grep -w 5.2.6) &> /dev/null
docker rm $(docker ps -a|grep -w 5.2.6) &> /dev/null
rm -rf /data/zabbix_data/
echo "删除完成"
}
