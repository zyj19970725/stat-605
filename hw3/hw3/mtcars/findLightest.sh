#!/bin/bash

cat out_csv/out1.csv out_csv/out2.csv out_csv/out3.csv | {
    light=1000000
    while read n;do
	if (( $(echo "$light > $n" | bc -l) )); then
	    light=$n
	fi
    done
    echo $light>out
}
