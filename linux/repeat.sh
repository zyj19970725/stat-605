#!/bin/bash

#Repeat <word> <n> times.

if [[ $# -ne 2 ]]; then
    echo "usage: $0 <word> <n>" 1>&2
    exit 0
fi

echo $#
word=$1
n=$2
for i in $(seq $n); do
    echo $word
done
