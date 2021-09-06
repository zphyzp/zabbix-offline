#！/bin/bash
#关闭防火墙
systemctl stop firewalld
systemctl disable firewalld

#安装环境依赖
yum install -y docker/*.rpm

#安装docker
rpm -ivh docker/pak/container-selinux-2.107-3.el7.noarch.rpm
rpm -ivh docker/pak/containerd.io-1.3.9-3.1.el7.x86_64.rpm
rpm -ivh docker/pak/docker-ce-cli-19.03.9-3.el7.x86_64.rpm
rpm -ivh docker/pak/docker-ce-19.03.9-3.el7.x86_64.rpm

#启停docker
systemctl start docker
systemctl stop docker

#修改docker容器默认存放目录
mkdir -p /data/docker/lib
mkdir -p /etc/systemd/system/docker.service.d/

cat > /etc/systemd/system/docker.service.d/devicemapper.conf << EOF
[Service]
ExecStart=
ExecStart=/usr/bin/dockerd  --graph=/data/docker/lib/
EOF

#重启docker
systemctl daemon-reload
systemctl start docker

#安装docker-compose
cp docker-zabbix/docker-compose/docker-compose /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

#加载docker镜像
docker load < docker-zabbix/img/5.2.6/web
docker load < docker-zabbix/img/5.2.6/server
docker load < docker-zabbix/img/5.2.6/mysql
docker load < docker-zabbix/img/5.2.6/java
