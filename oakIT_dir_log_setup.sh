#!/bin/bash

mkdir -p ~/monitoring/dir_logging
dir_logger_file=~/monitoring/dir_logging/dir_log_events.log
~/oakIT_dir_logger.sh $1 >> $dir_logger_file


