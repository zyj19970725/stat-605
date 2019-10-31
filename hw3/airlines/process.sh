#!/bin/bash

cat $(ls -a MSN*.csv) > allMSN.csv

cat $(ls -a *.out) | {
    far=0
    while read n; do
	dis=$(echo $n | cut -f 3 -d , )
	if (( $(echo "$far < $dis" | bc -l) )); then
	    far=$dis
	    origin=$(echo $n | cut -f 1 -d , )
	    dest=$(echo $n | cut -f 2 -d , )
	fi
    done
    echo "$origin","$dest","$far" 1>out
}

Rscript help.R

echo " Mo Tu We Th Fr Sa Su" >>out
cat week.txt >> out
