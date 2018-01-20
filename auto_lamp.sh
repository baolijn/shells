#!/bin/bash
#auto install lamp
#by libao 2018

#httpd define path variables
H_FILE=httpd-2.2.34.tar.bz2
H_FILE_DIR=httpd-2.2.34
H_URL=http://mirrors.cnnic.cn/apache/httpd
H_PREFIX=/usr/local/apache2

wget -c $H_URL/$H_FILE && tar -jxvf $H_FILE && cd $H_FILE_DIR; ./configure --prefix=$H_PREFIX

if [ $? -eq 0 ];then
	make && make install
	echo -e "\033[32mThe $H_FILE_DIR server install successfuly!033[0m"
else
	
	echo -e "\033[32mThe $H_FILE_DIR server install failed!033[0m"
	exit
fi
