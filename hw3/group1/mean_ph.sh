#!/bin/bash

echo "usage: $0 <column> [file.csv]" 1>&2

column=$1

if [ -z $2 ];then
    file="-"
else
    file=$2
fi

cat $file | cut -d ',' -f $column | tail -n +2 |{
    sum=0
    count=0
    while read n;do
	sum=$(($sum+$n))
	count=$(($count+1))
    done
    mean=$(echo "scale=6; $sum/$count" |bc)
    echo $mean
}
