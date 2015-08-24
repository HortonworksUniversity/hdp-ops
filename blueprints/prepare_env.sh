#!/bin/bash

cur=$PWD

cd /root/scripts
./env_setup.sh
yum -y install ambari-server
./copy_jdk.sh
ambari-server setup -s

sed -i "/agent.task.timeout=600/c\agent.task.timeout=3000" /etc/ambari-server/conf/ambari.properties
find /var/lib/ambari-server/resources/stacks/ -name metainfo.xml | while read file; do 
  sed -i "/<timeout>.*<\/timeout>/c\<timeout>3000<\/timeout>" $file 
done

ambari-server start
cd $cur

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

