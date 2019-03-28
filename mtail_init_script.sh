#!/bin/bash

mtail_root_dir=~/monitoring/tools/mtail
cd $mtail_root_dir
nohup ./mtail*amd64 -address localhost -logs ~/monitoring/dir_logging/dir_log_events.log -progs file_usage_log.mtail -metric_push_interval_seconds 2 -port 3002 2>&1 &
