#!/bin/bash

nProcessors=5
wget http://pages.stat.wisc.edu/~jgillett/605/CHTC/wordCounting/shakespeare.tar
tar xvf shakespeare.tar shakespeare
cd shakespeare
files=$(ls */*)

cat $files > ../data.txt

cd ..
rm -r shakespeare
rm shakespeare.tar

data="data.txt"
nDataLines=$(wc -l < $data)
nLinesPerSplitFile=$(($nDataLines / $nProcessors))
remainder=$(($nDataLines % $nProcessors))
if [[ $remainder > 0 ]]; then
  nLinesPerSplitFile=$(($nLinesPerSplitFile + 1))
fi
split -d -l $nLinesPerSplitFile $data "$data."




