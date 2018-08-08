#!/bin/bash

cd $1 # enter directory with images

outdir=$2

for i in *@3x.png
do
  filename="$(cut -d'@' -f1 <<<"$i")"
  echo "creating icon asset for $filename"

  echo "case $filename = \"$filename\"" >> "../case.out"

  mkdir ../$outdir/$filename.imageset

  cp $filename.png ../$outdir/$filename.imageset
  cp $filename@2x.png ../$outdir/$filename.imageset
  cp $filename@3x.png ../$outdir/$filename.imageset

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
done
