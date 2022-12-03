#!/bin/sh

killall -q xidlehook

while pgrep -u $UID -x xidlehook > /dev/null; do sleep 1; done

exec xidlehook --not-when-fullscreen --not-when-audio --detect-sleep --timer 300 "lock" - &

# $suspension --timer 600 "loginctl suspend" -
