#!/bin/bash
#auto create files
#by libao 2018

FILE=/tmp/20180120/test.txt

if [ ! -f $FILE ];then
	echo "ok" >>$FILE
else
	echo -e "\033[32m--------------------------\033[1m"
	cat $FILE
fi
