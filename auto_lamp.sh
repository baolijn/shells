#!/bin/bash
#auto install lamp
#by libao 2018

#httpd define path variables
H_FILE=httpd-2.2.34.tar.bz2
H_FILE_DIR=httpd-2.2.34
H_URL=http://mirrors.cnnic.cn/apache/httpd
H_PREFIX=/usr/local/apache2

if [ -z "$1" ];then
	echo -e "\033[32mPlease select follow install menu:033[0m"
	echo -e "\033[32m1)Compile and install Apache server033[0m"
	echo -e "\033[32m2)Compile and install MySQL server033[0m"
	echo -e "\033[32m3)Compile and install PHP server033[0m"
	echo -e "\033[32m4)Config index.php and start LAMP service033[0m"
	echo -e "\033[31mUsage: {/bin/sh $0 1|2|3|4|help}033[0m"
	exit
fi

if [ $1 -eq 1 ];then

	wget -c $H_URL/$H_FILE && tar -jxvf $H_FILE && cd $H_FILE_DIR; ./configure --prefix=$H_PREFIX

	if [ $? -eq 0 ];then
		make && make install
		echo -e "\033[32mThe $H_FILE_DIR server install successfuly!033[0m"
	else
	
		echo -e "\033[32mThe $H_FILE_DIR server install failed!033[0m"
		exit
	fi
fi
