#!/bin/sh

RESULT_DIR='./result'

MARGIN_X=30
MARGIN_Y=20

if [ $# -ne 1 ]; then
	echo "[Usage] `basename $0` (pdf path you want to tune)"
	exit 1
fi

if [ ! -f $1 ]; then
	echo "$1 is not file. Please set pdf file path"
	exit 1
fi

is_pdf=`echo $1 | egrep "\.pdf$"`
if [ ! ${is_pdf} ]; then
	echo "$1 is not PDF file. Please set pdf file path"
	exit 1
fi


if [ ! -d ${RESULT_DIR} ]; then
	mkdir ${RESULT_DIR}
fi


echo "=====<< Start Processing [ `basename $1 ` ] >>====="
echo "identify process....."
width_height=`identify $1 | head -n1 | awk -F" " '{print \$3}'`
echo "identify done"


width=`echo ${width_height} | sed -e "s/\(.*\)x\(.*\)/\1/g"`
height=`echo ${width_height} | sed -e "s/\(.*\)x\(.*\)/\2/g"`
echo "This pdf (width, height) = (${width}, ${height})"

result_w=`expr ${width} - ${MARGIN_X} \* 2`
result_h=`expr ${height} - ${MARGIN_Y} \* 2`

RESULT_PATH=${RESULT_DIR}/`basename $1`

if [ -f ${RESULT_PATH} ]; then
	rm -f ${RESULT_PATH}
fi

crop_cmd="convert -density 150x150  -compress jpeg -quality 80 -crop +${MARGIN_X}+${MARGIN_Y} $1 ${RESULT_PATH}"
echo "Start crop command : ${crop_cmd}"
echo "Now processing...."
eval ${crop_cmd}
echo "End Processing"

exit 0
