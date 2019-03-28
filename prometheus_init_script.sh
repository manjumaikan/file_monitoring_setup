#!/bin/bash

cd /home/developer/prometheus/prometheus-2.2.0-rc.0.linux-amd64
nohup ./prometheus --config.file=prometheus.yml --web.enable-lifecycle 2>&1 &

