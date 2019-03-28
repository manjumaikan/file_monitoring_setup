#!/bin/bash

echo "*******************************************************************************************************"
file_folder=$1
echo "number of folders in the file system is" $(find $file_folder/* -maxdepth 0 -type d | wc -l)
folder_count=$(find $file_folder/* -maxdepth 0 -type d | wc -l)
folders=($(find $file_folder/* -maxdepth 0 -type d))
all_folders=""
for i in $(find $file_folder/* -maxdepth 0 -type d)
do
	dir_size=$(du -sb $i)
	dir_size_omit_space=${dir_size%%/*}
	dir_size_in_kilo_bytes=${dir_size_omit_space=//[[:space:]]}
	echo "Size of Directory $i at $(date) is  $dir_size_in_kilo_bytes"
	all_folders="$all_folders $i"
done
	root_dir_size=$(du -sb $1 --exclude="$all_folders")
	root_dir_size_omit_space=${root_dir_size%%/*}
	root_dir_size_in_kilo_bytes=${root_dir_size_omit_space=//[[:space:]]}
echo "Size of Directory $1 at $(date) is  $root_dir_size_in_kilo_bytes"
#echo $all_folders
cd $1
echo "Size of Directory $1/* at $(date) is  $(ls -l | awk '!/^d/ {sum+=$5} END {print sum}')"
echo "*******************************************************************************************************"
