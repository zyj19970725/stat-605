#!/bin/bash

export LC_ALL=C
cat $1 | tr ' ' "\n" | tr "\t" "\n" | sort 1> sort.$1
