#!/bin/bash

avg_TotalAssessedValue=$(grep "MADISON SCHOOLS"  Property_Tax_Roll.csv|awk -v FS=, '{sum += $7; count += 1} END {print sum/count}')
echo $avg_TotalAssessedValue 
