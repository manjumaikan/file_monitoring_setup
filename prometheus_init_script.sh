#!/bin/bash

prom_root_dir=~/monitoring/tools/prometheus
cd $prom_root_dir/prometheus*amd64
nohup ./prometheus --config.file=prometheus.yml --web.enable-lifecycle 2>&1 &

