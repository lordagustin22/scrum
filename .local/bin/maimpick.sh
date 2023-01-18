#!/bin/sh

# This is bound to Shift+PrintScreen by default, requires maim. It lets you
# choose the kind of screenshot to take, including copying the image or even
# highlighting an area to copy. scrotcucks on suicidewatch right now.

# variables
output="$(date '+%y%m%d-%H%M-%S').png"
xclip_cmd="xclip -sel clip -t image/png"

case "$(printf "a selected area\\ncurrent window\\nfull screen\\na selected area (copy)\\ncurrent window (copy)\\nfull screen (copy)" | rofi -dmenu -l 6 -i -p "Screenshot which area?")" in
    "a selected area") maim -s -u pic-selected-"${output}" ;;
    "current window") maim -u -q -d 0.2 -i "$(xdotool getactivewindow)" pic-window-"${output}" ;;
    "full screen") maim -u -q -d 0.2 pic-full-"${output}" ;;
    "a selected area (copy)") maim -s -u | ${xclip_cmd} ;;
    "current window (copy)") maim -u -q -d 0.2 -i "$(xdotool getactivewindow)" | ${xclip_cmd} ;;
    "full screen (copy)") maim -u -q -d 0.2 | ${xclip_cmd} ;;
esac