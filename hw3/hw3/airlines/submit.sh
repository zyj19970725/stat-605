#!/bin/bash

module load R/R-3.6.1

job1=$(sbatch --array=1-22 --output="cache" getdata.sh)
job1=$(echo $job1| sed 's/Submitted batch job //')

job2=$(sbatch --output="cache" --dependency=afterany:$job1 process.sh)
