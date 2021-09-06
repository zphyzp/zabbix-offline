#!/bin/bash
##############创建docker网络##################
PROXYNET()
{
docker network ls|grep -wE zabbix-proxy &> /dev/null
if [ $? -ne 0 ];then
   `docker network create --subnet 172.21.0.0/16 --ip-range 172.21.240.5/20 zabbix-proxy` &> /dev/null
    echo "zabbix-proxy已创建"
else
    echo "zabbix-proxy已存在"
fi
}
