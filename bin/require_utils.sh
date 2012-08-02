#!/bin/sh

util_home=${HOME}/bin/utils
if [ -d ${util_home} ]; then
	# load utils function
	for file in `ls ${util_home}`
	do
		. ${util_home}/${file}
	done
fi
