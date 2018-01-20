#!/bin/bash
#auto backup mysql
#by libao 2018

BAK_DIR=/data/backup/`date +%Y%m%d`
MYSQLDB=libao
MYSQLUSR=libao
MYSQLPW=123456
MYSQLCMD=/usr/bin/mysqldump

if [ $UID -ne 0 ];then
	echo "Must use root for executing."
	exit
fi

if [ ! -d $BAK_DIR ];then
	mkdir -p $BAK_DIR
	echo "\033[32mThe $BAK_DIR created."
else
	echo "This file exists..."
fi


$MYSQLCMD -u$MYSQLUSR -p$MYSQLPW -d $MYSQLDB >$BAK_DIR/$MYSQLDB.sql

if [ $? -eq 0 ];then
	echo -e "\033[32mThe MySQL Backup $MYSQLDB Successfuly\033[0m"
else
	
	echo -e "\033[32mThe MySQL Backup $MYSQLDB Failed\033[0m"
fi
