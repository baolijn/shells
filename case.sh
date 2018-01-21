#!/bin/bash

case $1 in 
	
	Apache)
	echo "waiting install httpd"
	;;
	MySQL)
	echo "waiting install MySQL"
	;;
	PHP)
	echo "waiting install PHP"
	;;
	*)
	echo "Usage: {$0 Apache|MySQL|PHP|help}"
	;;
esac
