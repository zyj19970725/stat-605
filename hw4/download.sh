#!/bin/bash

if [ ! -d data ]; then
    wget http://pages.stat.wisc.edu/~jgillett/605/2/data.tar
    tar xvf data.tar data
    wget http://pages.stat.wisc.edu/~jgillett/605/2/cB58_Lyman_break.fit
fi


