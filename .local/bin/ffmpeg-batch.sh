#!/bin/sh

# Convert an entire directory with ffmpeg

srcExt=$1
destExt=$2

srcDir=$3
destDir=$4

opts=$5

for filename in "$srcDir"/*.$srcExt; do
    basePath=${filename%.*}
    baseName=${basePath##*/}

    ffmpeg -i "$filename" $opts "$destDir"/"$baseName"."$destExt"
    rm -f "$destDir"/"$baseName"."$srcExt"
done

notify-send "Conversion de ${srcExt} a ${destExt} completado nwn"
