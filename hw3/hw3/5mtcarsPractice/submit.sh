#!/bin/bash


module load R/R-3.6.1

if [ ! -d out_csv ] ; then
    mkdir out_csv
else
    rm -r out_csv
    mkdir out_csv
fi


job1=$(sbatch --output="cache" getData.sh)
job1=$(echo $job1 | sed 's/Submitted batch job //')

#jobId2=$(sbatch --array=1-3 --output="slurm_out/slurm-%A_%a.out" --dependency=afterany:$job1 jobArray.sh)
job2=$(sbatch --array=1-3 --output="cache" --dependency=afterany:$job1 jobArray.sh)
job2=$(echo $job2 | sed 's/Submitted batch job //')

job3=$(sbatch --output="cache" --dependency=afterany:$job2 findLightest.sh)
