#!/bin/sh

function is_num {
  if [ $# -eq 0 ]; then
    echo 0
    return
  fi

  EXISTS_CHAR=`echo ${1} | sed -e 's/[0-9]//g'`

  if [ "${EXISTS_CHAR}" = "" ]; then
    echo 1
    return
  fi

  echo 0
  return
}
