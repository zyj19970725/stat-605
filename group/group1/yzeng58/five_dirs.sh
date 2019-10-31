#!/bin/bash

mkdir five
cd five
mkdir dir{1..5}
for num in {1..4};
do
    for dir in {1..5};
    do
        i=$(($num-1))
        echo $num > "dir${dir}/file${num}"
        while [[ $i -gt 0 ]];
	do
      	    echo $num >> "dir${dir}/file${num}" 
	    i=$(($i-1));
	done
    done
done
cd ..
