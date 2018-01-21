#!/bin/bash

i=0

#while [[ $i -lt 10 ]]
while (( $i < 10 ))

do
	echo "The num is $i"
	((i++))
done
