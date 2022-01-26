#!/bin/sh

dpath=~/Descargas/duan/backups
list=$dpath/program-list
if ! [[ -e $list ]]
then
touch $list
fi
echo 'Programs installed on Artix Linux as of today (includes AUR)' > $list && date | awk '{print $1,$2,$3,$4}' >> $list && pacman -Qeq >> $list
notify-send --urgency=low "Lista de programas actualizada"
