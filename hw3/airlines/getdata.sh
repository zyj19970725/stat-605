#!/bin/bash

year=$(($SLURM_ARRAY_TASK_ID+1986))

wget http://stat-computing.org/dataexpo/2009/$year.csv.bz2
bzip2 -d $year.csv.bz2
rm $year.csv.bz2
cat $year.csv | cut -f 4,16,17,18,19 -d , | awk -F , '$3=="MSN" { print }' > MSN$year.csv



cat MSN$year.csv | {
    far=0
    while read n; do
	dis=$(echo $n | cut -f 5 -d , )
	if (( $(echo "$far < $dis" | bc -l) )); then
	    far=$dis
	    origin=$(echo $n | cut -f 3 -d , )
	    dest=$(echo $n | cut -f 4 -d , )
	fi
    done
    echo "$origin","$dest","$far" 1>$year.out
}

