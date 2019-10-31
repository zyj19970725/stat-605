#!/bin/bash

file="NetID.cxx"
pattern="(.*).(cxx)"
if [[ $file =~ $pattern ]]; then
    echo ${BASH_REMATCH[2]}
fi
