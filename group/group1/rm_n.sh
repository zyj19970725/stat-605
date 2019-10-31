#!/bin/bash

if [ -z $2 ]; then
    echo "usage: $0 <dir> <n>" 1>&2  
    exit 1
fi
files=$(find $1 -size +"$2"c)
for file in $files; do
    if [ ! -d $file ]; then
	rm ${file}
    fi
done 	   
	   
