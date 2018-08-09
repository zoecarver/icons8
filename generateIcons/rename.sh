#!/bin/bash

cd $1

for i in *
do
  filename="$(echo $i | awk -F "icons8-" 'NR==1 {print $2}')"
  echo "working on $filename"
  mv $i $filename
done
