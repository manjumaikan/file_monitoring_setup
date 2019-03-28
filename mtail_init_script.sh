#!/bin/bash

mtail_root_dir=~/monitoring/tools/mtail
cd $mtail_root_dir
nohup ./mtail_v3.0.0-rc13_linux_amd64 -address localhost -logs /opt/IBM/WebSphere/AppServer/profiles/AppSrv01/logs/server1/SystemOut.log -progs mfile1.mtail -metric_push_interval_seconds 2 -port 3903 2>&1 &
