#!/bin/sh

# Take screenshoot
maim -u /tmp/screen.png

# Blurred image
convert /tmp/screen.png -paint 1 -swirl 180 -gravity center -matte /tmp/screen.png

# Lock screen
i3lock -e -f -c 000000 -i /tmp/screen.png
