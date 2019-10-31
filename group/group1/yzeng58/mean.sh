#!/bin/bash

file=$2
if [ -z $2 ]; then
    file=<&0
    if [ -z file ]; then
	echo "usage: $0 <column> [file.csv]" 1>&2
	exit 1
    fi
fi

mean=$(cat $file| tail -n +2 | cut -f $1 -d ,|awk  '{sum += $1; count += 1} END {print sum/count}')
echo $mean
