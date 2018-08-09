#!/bin/bash

cd $1 # enter directory with images

outdir=$2

# Skipping this one for now becuse it conflicst with the below one

# for i in *@3x.png
# do
#   filename="$(cut -d'@' -f1 <<<"$i")"
#   echo "creating icon asset for $filename"
# 
#   echo "case $filename = \"$filename\"" >> "../case.out"
# 
#   mkdir ../$outdir/$filename.imageset
# 
#   cp $filename.png ../$outdir/$filename.imageset
#   cp $filename@2x.png ../$outdir/$filename.imageset
#   cp $filename@3x.png ../$outdir/$filename.imageset
# 
#   cat << EOF > ../$outdir/$filename.imageset/Contents.json
#   {
#     "images" : [
#       {
#         "idiom" : "universal",
#         "filename" : "$filename.png",
#         "scale" : "1x"
#       },
#       {
#         "idiom" : "universal",
#         "filename" : "$filename@2x.png",
#         "scale" : "2x"
#       },
#       {
#         "idiom" : "universal",
#         "filename" : "$filename@3x.png",
#         "scale" : "3x"
#       }
#     ],
#     "info" : {
#       "version" : 1,
#       "author" : "xcode"
#     }
#   }
# EOF
# done


for i in @3x/*
do
  filename="$(echo $i | awk -F "/" 'NR==1 {print $2}')"
  casename="$(echo "$filename" | tr -d -)"
  casename="$(echo "$casename" | tr -d +)"
  casename="$(echo "$casename" | sed 's/.\{4\}$//')"
  casename="$(echo "$casename" | tr -d .)"

  echo "creating icon asset for $filename with case $casename"

  first="$(echo $casename | head -c 1)"
  if [ "$first" -eq "$first" ] 2>/dev/null; then
    echo "appending i to escape integer"
    echo "case i$casename = \"$filename\"" >> "../case.out"
  elif [ "$casename" == "as" ] || [ "$casename" == "class" ] || [ "$casename" == "do" ] || [ "$casename" == "is" ] || [ "$casename" == "switch" ] ; then
    echo "appending i to escape reserve word"
    echo "case i$casename = \"$filename\"" >> "../case.out"
  else
    echo "case $casename = \"$filename\"" >> "../case.out"
  fi

  mkdir ../$outdir/$filename.imageset

  cp @3x/$filename ../$outdir/$filename.imageset/$filename@3x.png
  cp @2x/$filename ../$outdir/$filename.imageset/$filename@2x.png 
  cp @1x/$filename ../$outdir/$filename.imageset/$filename.png 

  cat << EOF > ../$outdir/$filename.imageset/Contents.json
  {
    "images" : [
      {
        "idiom" : "universal",
        "filename" : "$filename.png",
        "scale" : "1x"
      },
      {
        "idiom" : "universal",
        "filename" : "$filename@2x.png",
        "scale" : "2x"
      },
      {
        "idiom" : "universal",
        "filename" : "$filename@3x.png",
        "scale" : "3x"
      }
    ],
    "info" : {
      "version" : 1,
      "author" : "xcode"
    }
  }
EOF

  # if [ "$casename" -eq "$casename" ] 2>/dev/null; then
  #   echo "skipping number"
  # else 
  #   if grep -Fxq "$casename" ../case.out; then
  #     echo "skipping repeat"
  #   else
  #   fi
  # fi

  # echo "case $casename = \"$filename\"" >> "../case.out"

done
