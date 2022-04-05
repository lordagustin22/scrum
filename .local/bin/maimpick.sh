#!/bin/sh

# This is bound to Shift+PrintScreen by default, requires maim. It lets you
# choose the kind of screenshot to take, including copying the image or even
# highlighting an area to copy. scrotcucks on suicidewatch right now.

case "$(printf "a selected area\\ncurrent window\\nfull screen\\na selected area (copy)\\ncurrent window (copy)\\nfull screen (copy)" | dmenu -l 6 -i -p "Screenshot which area?")" in
       "a selected area") maim -s -u ~/Imagenes/screenshot/pic-selected-"$(date '+%d%m%y-%H%M-%S').png" ;;
       "current window") maim -u -i "$(xdotool getactivewindow)" ~/Imagenes/screenshot/pic-window-"$(date '+%d%m%y-%H%M-%S').png" ;;
 	"full screen") maim -u --delay=0.5 ~/Imagenes/screenshot/pic-full-"$(date '+%d%m%y-%H%M-%S').png" ;;
        "a selected area (copy)") maim -s -u --format png /dev/stdout | copyq copy image/png - ;;
        "current window (copy)") maim -u -i "$(xdotool getactivewindow)" --format png /dev/stdout | copyq copy image/png - ;;
        "full screen (copy)") maim -u --delay=0.5 --format png /dev/stdout | copyq copy image/png - ;;
esac
