#!/bin/bash

sum=0
pattern=[10]{4}
for num in {1000..2000};
do  
    if [[ $num =~ $pattern ]]; then
	sum=$(($sum+$num))
fi
done
echo $sum
