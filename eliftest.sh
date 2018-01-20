#!/bin/bash
#auto test scores
#by libao 2018

score=$1

if [ -z $score ];then
	echo "usage: {$0 60|80.}"
	exit
fi

if [[ $score -gt 85 ]];then
	echo "very good"
elif [[ $score -gt 75 ]];then
	echo "good"
elif [[ $score -gt 60 ]];then
	echo "pass"
else
	echo "no pass"
fi
