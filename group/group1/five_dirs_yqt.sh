#!/bin/bash

mkdir -p ./five

for i in {1..5};
do
    mkdir -p ./five/dir$i
    for j in {1..4};
    do
	echo $j > ./five/dir$i/file$j.txt
	num=1
	while [[ $num -lt $j ]];
	do
	    echo $j >> ./five/dir$i/file$j.txt
	    num=$(($num + 1))
	done
    done
done
