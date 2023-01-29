#!/bin/sh

# hyperborea route
route=($HOME/Imagenes/Backgrounds/hyperborea)

# Blurred image
if ! [[ -e $route/hyperborea-blur.png ]]; then
    convert $route/hyperborea.jpeg -blur 0x20 -paint 2 -bordercolor '#4c566a' -border 10x10 $route/hyperborea-blur.png
fi


# Lock screen
lock() {
    i3lock --verif-text="verificando malongo nwn" --wrong-text="jeje ta mal" --noinput-text="pero pone algo gordo choripanero" -e -f -L -i $route/hyperborea-blur.png
}

lock

# case "$(printf "Bloquear\\nSuspender" | dmenu -l 2 -i -p "Qué desea hacer?")" in
#     "Bloquear") lock ;;
#     "Suspender") loginctl suspend && lock ;;
# esac
