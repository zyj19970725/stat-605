#!/bin/bash

# Write a toy data file for practice.
Rscript -e "write.csv(x=mtcars, file='mtcars.csv');"

# Write a bash pipeline to find the highest-mileage 4-cylinder car.
cat mtcars.csv | # Write "mtcars.csv" to stdout.
tail -n +2 | # Write lines starting with the second (skip header).
cut -d, -f2,3 | # Select columns: using delimiter ",", write fields 2 and 3
                # (mpg, cyl). \
awk -F, '{ if ($2 == "4") {print $0} }' | # Select rows with 2nd field "4".
cut -d, -f1 | # Using delimiter ",", write field 1 (mpg).
sort -n | # Sort by numeric value.
tail -1 # Write last line.

# Here's the pipeline again in one line. Build up the pipeline one
# command at time, running it each time.
cat mtcars.csv | tail -n +2 | cut -d, -f2,3 | awk -F, '{ if ($2 == "4") {print $0} }' | cut -d, -f1 | sort -n | tail -1
