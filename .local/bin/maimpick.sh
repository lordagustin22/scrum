#!/bin/sh

# This is bound to Shift+PrintScreen by default, requires maim. It lets you
# choose the kind of screenshot to take, including copying the image or even
# highlighting an area to copy. scrotcucks on suicidewatch right now.

case "$(printf "a selected area\\nfull screen\\na selected area (copy)\\nfull screen (copy)" | dmenu -l 4 -i -p "Screenshot which area?")" in
	"a selected area") maim -s -u ~/Imágenes/screenshot/pic-selected-"$(date '+%d%m%y-%H%M-%S').png" ;;
	# "current window") maim -i -u "$(xdotool getactivewindow)" ~/Imágenes/screenshot/pic-window-"$(date '+%d%m%y-%H%M-%S').png" ;;
	"full screen") maim -u --delay=0.5 ~/Imágenes/screenshot/pic-full-"$(date '+%d%m%y-%H%M-%S').png" ;;
	"a selected area (copy)") maim -s -u | xclip -selection clipboard -t image/png ;;
	# "current window (copy)") maim -i -u "$(xdotool getactivewindow)" | xclip -selection clipboard -t image/png ;;
	"full screen (copy)") maim -u --delay=0.5 | xclip -selection clipboard -t image/png
esac
