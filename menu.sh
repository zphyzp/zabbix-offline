#!/bin/bash
# 安装菜单函数1
MENUA()
{
cat <<-EOF
################################################################################
#                                                                              #
#                 欢迎使用zabbix-docker-5.2.6安装工具，请输入序号：            #    
#   1. 离线安装                                                                #
#   2. 卸载                                                                    #
#   q. exit                                                                    #
#                                                                              #
################################################################################
EOF
}

# 安装菜单函数2
MENUB()
{
cat <<-EOF
################################################################################
#                                                                              #
#               欢迎使用zabbix-docker-5.2.6安装工具，请输入序号:               #
#   h. help(帮助/上一级)                                                       # 
#   1. 离线安装zabbix-server及dockers环境（新机必装）                          #
#   2. 仅安装zabbix-server,不安装docker环境                                    #
#   3. 离线安装proxy及dockers环境(在与server不同设备上部署proxy时执行此步骤)   #
#   4. 仅安装proxy，不安装docker环境(在与server同设备上部署proxy时执行此步骤)  #
#                                                                              #
################################################################################
EOF
}

# 卸载菜单函数
MENUC()
{
cat <<-EOF
################################################################################
#                                                                              #
#               欢迎使用zabbix-docker-5.2.6安装工具，请输入序号：              #  
#   h. help(帮助/上一级)                                                       # 
#   1. 卸载zabbix-server(删除持久化目录)                                       #
#   2. 卸载zabbix-proxy                                                        #
#   3. 全部卸载                                                                #     
#                                                                              #
################################################################################
EOF
}

# 运维菜单函数
MENUYW()
{
cat <<-EOF
##################################################################################
#                                                                                #
#                   欢迎使用zabbix-docker-5.2.6运维工具，请输入：                #
#   h      help                                                                  #
#   rs     重启sever镜像                                                         #
#   rsm    重启server-mysql镜像                                                  #
#   rsw    重启web镜像                                                           #
#   rp     重启proxy镜像                                                         #
#   rpm    重启proxy-mysql镜像                                                   #
#   ra     重启所有zabbix镜像                                                    #
#   rd     重启docker                                                            #
#   q      exit                                                                  #
#                                                                                #
##################################################################################
EOF
}
