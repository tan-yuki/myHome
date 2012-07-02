#!/bin/sh
cd $(dirname $0)

# copy dotsfile to home dir
for homefile in `ls -a`
do
    if [ $homefile != '..' ] && 
       [ $homefile != '.' ] && 
       [ "$homefile" != "`basename $0`" ] && 
       [ $homefile != '.git' ] && 
       [ $homefile != '.gitignore' ]
    then
        ln -fs "$PWD/$homefile" $HOME
    fi
done

