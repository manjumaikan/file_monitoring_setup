#!/bin/bash

echo "set up mtail"
mtail_root_dir=~/monitoring/tools/mtail
mkdir -p $mtail_root_dir
cd $mtail_root_dir
wget https://github.com/google/mtail/releases/download/v3.0.0-rc29/mtail_v3.0.0-rc29_linux_amd64
cp ~/file_usage_log.mtail ~/mtail_init_script.sh $mtail_root_dir

echo "set up prometheus"
prometheus_root_dir=~/monitoring/tools/prometheus
mkdir -p $prometheus_root_dir
cd $prometheus_root_dir
wget https://github.com/prometheus/prometheus/releases/download/v2.8.0/prometheus-2.8.0.linux-amd64.tar.gz
tar xvzf prometheus-2.8.0.linux-amd64.tar.gz
rm prometheus-2.8.0.linux-amd64.tar.gz
cp ~/prometheus.yml ~/prometheus_init_script.sh $prometheus_root_dir/prometheus-2.8.0.linux-amd64/

echo "set up alertmanager"
alertmgr_root_dir=~/monitoring/tools/alertmanager
mkdir -p $alertmgr_root_dir
cd $alertmgr_root_dir
wget https://github.com/prometheus/alertmanager/releases/download/v0.15.0-rc.1/alertmanager-0.15.0-rc.1.linux-amd64.tar.gz --no-check-certificate
tar xvzf alertmanager-0.15.0-rc.1.linux-amd64.tar.gz
rm alertmanager-0.15.0-rc.1.linux-amd64.tar.gz

echo "set up grafana"
sudo yum -y install https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana-5.1.0-1.x86_64.rpm
sudo service grafana-server start
sudo /sbin/chkconfig --add grafana-server
sudo systemctl restart grafana-server.service

echo "set up cloudwatch exporter"
cloudwatchexpr_root_dir=~/monitoring/tools/cloudwatchexpr
mkdir -p $cloudwatchexpr_root_dir
cd $cloudwatchexpr_root_dir
wget https://github.com/prometheus/cloudwatch_exporter/archive/master.zip
unzip master.zip
rm master.zip
cd cloudwatch_exporter-master
mvn package
