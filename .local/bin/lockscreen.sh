#!/bin/sh

exec xautolock -detectsleep -time 10 -locker "/home/utane/.local/bin/lock" -notify 30 -notifier "notify-send -u critical -t 10000 -- 'LOCKING screen in 30 seconds'" &
