#!/bin/bash
#auto create directory
#by libao 2108

DIR=/tmp/20180120
if [ ! -d $DIR ];then
	mkdir -p $DIR
	echo -e "\033[32mTHis $DIR create success!\033[0m"
else
	
	echo -e "\033[32mTHis $DIR exist!\033[0m"
fi
