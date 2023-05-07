#!/bin/sh

# first argument will be image
# second argument will be size
# third argument is the output
if [ $# -eq 4 ]; then
    convert $1 -quality $2 -resize $3 -sampling-factor 4:2:0 -strip -interlace JPEG -colorspace sRGB $4
fi

# for batch image, first argument is resize
# second argument is the output
if [ $# -eq 2 ]; then
    mogrify -quality 85 -resize $2 -sampling-factor 4:2:0 -strip -interlace JPEG -colorspace sRGB ! *.gif
fi
