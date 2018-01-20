#!/bin/bash
#auto if test
#by libao 2018

NUM1=100
NUM2=200

if(($NUM1 > $NUM2));then
	echo "This $NUM1 is greater than $NUM2"

else 	
	echo "This $NUM1 is not greater than $NUM2"
fi

