#!/bin/bash

# untar your R installation
tar -xzf R361.tar.gz
tar -xzf packages.tar.gz

# make sure the script will use your R installation, 
# and the working directory as its home location
export PATH=$PWD/R/bin:$PATH
export RHOME=$PWD/R
export R_LIBS=$PWD/packages

# run your script
./download.sh
Rscript hw4.R $1 $2 
                    
