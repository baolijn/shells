#!/bin/bash
#auto install lamp
#by libao 2018

#httpd define path variables
H_FILE=httpd-2.2.34.tar.bz2
H_FILE_DIR=httpd-2.2.34
H_URL=http://mirrors.cnnic.cn/apache/httpd
H_PREFIX=/usr/local/apache2

#MySQL define path variale
M_FILES=mysql-5.5.20.tar.gz
M_FILES_DIR=mysql-5.5.20
M_URL=http://down1.chinaunix.net/distfiles/
M_PREFIX=/usr/local/mysql

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

#Install Mysql DB server 
if [[ "$1" -eq "2" ]];then

        wget -c $M_URL/$M_FILES &&  tar -xzvf $M_FILES && cd $M_FILES_DIR &&yum install cmake -y ;cmake . -DCMAKE_INSTALL_PREFIX=$M_PREFIX \
-DMYSQL_UNIX_ADDR=/tmp/mysql.sock \
-DMYSQL_DATADIR=/data/mysql \
-DSYSCONFDIR=/etc \
-DMYSQL_USER=mysql \
-DMYSQL_TCP_PORT=3306 \
-DWITH_XTRADB_STORAGE_ENGINE=1 \
-DWITH_INNOBASE_STORAGE_ENGINE=1 \
-DWITH_PARTITION_STORAGE_ENGINE=1 \
-DWITH_BLACKHOLE_STORAGE_ENGINE=1 \
-DWITH_MYISAM_STORAGE_ENGINE=1 \
-DWITH_READLINE=1 \
-DENABLED_LOCAL_INFILE=1 \
-DWITH_EXTRA_CHARSETS=1 \
-DDEFAULT_CHARSET=utf8 \
-DDEFAULT_COLLATION=utf8_general_ci \
-DEXTRA_CHARSETS=all \
-DWITH_BIG_TABLES=1 \
-DWITH_DEBUG=0
make && make install

/bin/cp support-files/my-small.cnf /etc/my.conf
/bin/cp support-files/mysql.server /etc/init.d/mysqld
chmod +x /etc/init.d/mysqld
chkconfig --add mysqld
chkconfig mysqld on

        if [ $? -eq 0 ];then
                make && make install
                echo -e "\n\033[32m-----------------------------------------------\033[0m"
                echo -e "\033[32mThe $M_FILES_DIR Server Install Success !\033[0m"
        else
                echo -e "\033[32mThe $M_FILES_DIR Make or Make install ERROR,Please Check......"
                exit 0
        fi
fi
