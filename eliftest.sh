#!/bin/bash
#auto test scores
#by libao 2018

score=85

if [[ $score -gt 85 ]];then
	echo "very good"
elif [[ $score -gt 75 ]];then
	echo "good"
elif [[ $score -gt 60 ]];then
	echo "pass"
else
	echo "no pass"
fi
