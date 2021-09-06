#！/bin/bash
DIR="$( cd "$( dirname "$0"  )" && pwd  )"
cd $DIR

read -p "请输入zabbix web的端口号(直接回车默认为85端口):" WPORT
test -z $WPORT
if [ $? -eq 0 ];then
   WPORT=85
   echo $IP
else
   echo $IP
fi

export WPORT

#启动zabbix容器
docker-compose -f docker-compose/zabbix-docker.yml up -d
