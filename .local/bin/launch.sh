#!/bin/sh

# Terminate already running bar instances
if [ $(uptime | cut -d ' ' -f4) -le 3 ]; then
    lxappearance &
    sleep 1
    killall -q lxappearance
fi
battery-status &        # notify when battery is less than 20
killall -q polybar
# If all your bars have ipc enabled, you can also use
# polybar-msg cmd quit

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

# Launch Polybar, using default config location ~/.config/polybar/config.ini
polybar cliffmain 2>&1 | tee -a /tmp/polybar.log & disown
