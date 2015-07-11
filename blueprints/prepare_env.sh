#!/bin/bash

cur=$PWD

cd /root/scripts
./env_setup.sh
./copy_jdk.sh

cd $cur

yum -y install ambari-server
ambari-server setup -s
ambari-server start

ssh root@node1 bash <<EOF
yum -y install ambari-agent
sleep 20
sed -i 's/localhost/node1/' /etc/ambari-agent/conf/ambari-agent.ini
ambari-agent start
EOF

ssh root@node2 bash <<EOF
yum -y install ambari-agent
sleep 20
sed -i 's/localhost/node1/' /etc/ambari-agent/conf/ambari-agent.ini
ambari-agent start
EOF
ssh root@node3 bash <<EOF
yum -y install ambari-agent
sleep 20
sed -i 's/localhost/node1/' /etc/ambari-agent/conf/ambari-agent.ini
ambari-agent start
EOF
ssh root@node4 bash <<EOF
yum -y install ambari-agent
sleep 20
sed -i 's/localhost/node1/' /etc/ambari-agent/conf/ambari-agent.ini
ambari-agent start
EOF

