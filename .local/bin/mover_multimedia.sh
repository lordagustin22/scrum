#!/bin/sh

IMAGEN=$HOME/Imagenes
VIDEO=$HOME/Videos

# Mueve las imagenes a donde van las imagenes
# Chequea que el directorio exista
if [ ! -d $HOME/Imagenes ]; then
    mkdir $HOME/Imagenes
fi
for i in *.{jpg,png,webp}; do
    mv "$i" $HOME/Imagenes
done
notify-send "Imagenes movidas a $IMAGEN con éxito"

# Mueve los videos a donde tienen que ir
if [ ! -d $HOME/Videos ]; then
    mkdir $HOME/Videos
fi
for i in *.{avi,mp4,webm}; do
    mv "$i" $HOME/Videos
done
notify-send "Videos movidos a $VIDEO con éxito"

# Windows syntax

# @echo off
#
# set IMAGEN=%USERPROFILE%\Imagenes
# set VIDEO=%USERPROFILE%\Videos
#
# if not exist %IMAGEN% mkdir %IMAGEN%
# for %I in (*.jpg,*.png,*.webp) do move /Y "%I" %IMAGEN%
# echo "Imagenes movidas a %IMAGEN% con exito"
#
# if not exist %VIDEO% mkdir %VIDEO%
# for %I in (*.avi,*.mp4,*.webm) do move /Y "%I" %VIDEO%
# echo "Videos movidos a %VIDEO% con exito"
