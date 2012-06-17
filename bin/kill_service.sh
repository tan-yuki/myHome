#!/bin/sh

if [ $# -ne 1 ]; then
	echo "[Usage] $0 (service name)"
	exit
fi

pid=`ps auxwww | grep $1 | grep -v grep | grep -v $0 | awk -F" " '{print $2}'`
if [ ! $pid ]; then
	echo "Not runnning $1 service."
	exit
fi

kill -9 $pid
