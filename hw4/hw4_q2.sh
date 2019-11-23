#!/bin/bash
# untar your R installation
tar -xzf R361.tar.gz
tar -xzf packages.tar.gz

# make sure the script will use your R installation, 
# and the working directory as its home location
export PATH=$PWD/R/bin:$PATH
export RHOME=$PWD/R
export R_LIBS=$PWD/packages

# if [ ! -d data ]; then
#    mkdir data
# fi

# if [ ! -d csv ]; then
#    mkdir csv
# else
#     rm -r csv
#     mkdir csv
# fi

# run your script
echo $2
tar zxvf $2.tgz
echo $(pwd)
echo $(ls)
Rscript hw4.R $1 $2

# tar cvf csv.tar csv
# rm -r csv
echo $(ls)
