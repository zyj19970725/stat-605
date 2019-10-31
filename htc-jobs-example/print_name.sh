#!/bin/bash

## print the name passed in as the argument
## with information about the user and server
## running the job

echo "Greetings $1 from `whoami`@`hostname`"
cat try1.txt
cat try2.txt

echo $(python --version)
echo $(pwd)

## wait one minute
#sleep 10
