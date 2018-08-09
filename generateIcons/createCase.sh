#!/bin/bash

cd $1

for i in *
do
  filename="$(echo $i | awk -F "." 'NR==1 {print $1}')"
  filename="$(echo "$filename" | tr -d _)"
  filename="$(echo "$filename" | tr -d -)"
  echo "working on $filename"

  if [ "$filename" -eq "$filename" ] 2>/dev/null; then
    echo "skipping number"
  else 
    if grep -Fxq "$filename" ../../case.out; then
      echo "skipping repeat"
    else
      first="$(echo $filename | head -c 1)"
      if [ "$first" -eq "$first" ] 2>/dev/null; then
        echo "appending i to escape integer"
        echo "case i$filename = \"$i\"" >> "../../case.out"
      else
        echo "case $filename = \"$i\"" >> "../../case.out"
      fi
    fi
  fi
done
