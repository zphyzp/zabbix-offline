#！/bin/bash
ZABNET()
{
##############创建docker网络##################
docker network ls|grep -wE zabbix-net &> /dev/null
if [ $? -ne 0 ];then
   `docker network create --subnet 172.20.0.0/16 --ip-range 172.20.240.5/20 zabbix-net` &> /dev/null
    echo "zabbix-net已创建"
else
    echo "zabbix-net已存在"
fi
}
