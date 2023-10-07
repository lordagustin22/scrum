#!/bin/sh

find . -maxdepth 1 -type f \( -iname "*.mp4" -o -iname "*.mkv" \) -print0 | tr '\0' '\n' | dmenu -i -l 10 -p "Seleccione uno: " | xargs -I "{}" mpv "{}"
