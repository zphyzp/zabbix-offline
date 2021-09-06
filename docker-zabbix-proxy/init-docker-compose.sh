#！/bin/bash
DIR="$( cd "$( dirname "$0"  )" && pwd  )"
cd $DIR

read -p "请输入server端IP(直接回车默认本机IP):" IP
test -z $IP
if [ $? -eq 0 ];then
   IP=`ifconfig ens33|grep -w inet|awk '{print $2}'`
   echo $IP
else
   echo $IP
fi

while true
do
read -p "请输入proxy唯一标识(该标识为区别于其他proxy，请务必唯一并具有代表性):" NAME1
if  [ ! -n "$NAME1" ] ;then
    echo "不能为空，请重新输入"
else
docker ps |grep -w $NAME1
if [ $? -eq 0 ];then
   echo "该标识已存在，请重新输入"
else
   echo $NAME1
   break
fi
fi
done

while true
do
read -p "请输入proxy端口号(建议范围10052-10059):" PORT1
if  [ ! -n "$PORT1" ] ;then
    echo "不能为空，请重新输入"
else
netstat -lnptu|sed 's/::*/#/g'|awk -F# '{print $2}'|awk '{print $1}'|grep -v "^$"|grep -w $PORT1
if [ $? -eq 0 ];then
   echo "该端口已存在，请重新输入"
else
   echo $PORT1
   break
fi
fi
done

while true
do
read -p "请输入proxy-mysql端口号(建议范围30007-30015):" PORT2
if  [ ! -n "$PORT2" ] ;then
    echo "不能为空，请重新输入"
else
netstat -lnptu|sed 's/::*/#/g'|awk -F# '{print $2}'|awk '{print $1}'|grep -v "^$"|grep -w $PORT2
if [ $? -eq 0 ];then
   echo "该端口已存在，请重新输入"
else
   echo $PORT2
   break
fi
fi
done

export MPORT=$PORT2
export PPORT=$PORT1
export PNAME=$NAME1
export ZBX_SERVER_IP=$IP
export COMPOSE_PROJECT_NAME=$NAME1
echo -e "\033[31m proxy名称为 \"zabbix-proxy-$NAME1\" 请牢记!!! \033[0m"
#启动zabbix容器
docker-compose -f docker-compose/zabbix-docker-proxy.yml up -d


