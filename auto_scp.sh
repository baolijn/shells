#!/bin/bash

FILES=$*

if [ -z $* ];then
	echo "Usage: {$0 /boot|/tmp|/tmp/test/txt}"
	exit
fi

for i in `echo 127.0.0.1`

do

	scp -r $FILES root@$i:/root/

done

