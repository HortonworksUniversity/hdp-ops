#!/bin/bash

cur=$PWD
cd /tmp
apt-get install -y wget
rm -rf HDP2.2.zip*
wget https://github.com/HortonworksUniversity/hdp-ops/archive/HDP2.2.zip
scp -o "StrictHostKeyChecking=no" HDP2.2.zip node1:/tmp
ssh -o "StrictHostKeyChecking=no" root@node1 "bash -l " <<END
cd /tmp
rm -rf hdp-ops-HDP2.2/
unzip HDP2.2.zip
cd hdp-ops-HDP2.2/blueprints
./prepare_env.sh;./install_from_blueprint.sh
END
cd $cur

echo "Cluster install started. Check http://node1:8080 for progress."

