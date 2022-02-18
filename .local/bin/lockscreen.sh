#!/bin/sh

timeout="10000"

# Take screenshoot
maim -u /tmp/screen.png

# Blurred image
convert /tmp/screen.png -paint 1 -swirl 360 -gravity center -matte /tmp/screen.png

# Lock screen
i3lock -e -f -c 000000 -i /tmp/screen.png

while [[ $(pgrep -x i3lock) ]]; do
    [[ $timeout -lt $(xssstate -i) ]] && xset dpms force off
    sleep 5
done
