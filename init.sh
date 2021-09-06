#!/bin/bash
DIR="$( cd "$( dirname "$0"  )" && pwd  )"
cd $DIR
source menu.sh  
source docker-zabbix/init_net.sh
source docker-zabbix-proxy/init_net.sh
source uninit.sh
chmod +x docker-zabbix/init.sh
chmod +x docker-zabbix/init2.sh
chmod +x docker-zabbix/init-docker-compose.sh
chmod +x docker-zabbix/init-vloume.sh
chmod +x docker-zabbix-proxy/init1.sh
chmod +x docker-zabbix-proxy/init2.sh
chmod +x docker-zabbix-proxy/init-docker-compose.sh

while true
do
MENUA
read -p "请输入你的操作:" ACTA
case $ACTA in
    1)
    MENUB
    read -p "请输入你的操作:" ACTB
    case $ACTB in
            1)
            docker-zabbix/init.sh
            ZABNET
            docker-zabbix/init-vloume.sh
            docker-zabbix/init-docker-compose.sh
            ;;
	    2)
            docker-zabbix/init2.sh
	    ZABNET
	    docker-zabbix/init-docker-compose.sh
	    ;;
            3)
            docker-zabbix-proxy/init2.sh
            PROXYNET
            docker-zabbix-proxy/init-docker-compose.sh
            ;;
            4)
            docker-zabbix-proxy/init1.sh
            PROXYNET
            docker-zabbix-proxy/init-docker-compose.sh
            ;;
            h)
            MENUA
            ;;
    esac
    ;;
    2)
    MENUC
    read -p "请输入你的操作:" ACTC
    case $ACTC in
            1)
            UNSERVER
            ;;
            2)
            UNPROXY
            ;;
            3)
            UNALL
            ;;
            h)
            MENUA
            ;;
    esac
    ;;
    q)
    exit
    ;;
esac
done
