#！/bin/bash

DIR="$( cd "$( dirname "$0"  )" && pwd  )"
cd $DIR

#加载docker镜像
docker load < img/5.2.6/web
docker load < img/5.2.6/server
docker load < img/5.2.6/mysql
docker load < img/5.2.6/java
