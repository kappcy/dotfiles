#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bars
polybar left -r &
polybar middle -r &
polybar right -r &

# Tint2 fill in
until pgrep -u $UID -x polybar >/dev/null; do
    echo nope
    sleep 1
done
tint2 -c /home/kappcy/.config/tint2/static/polybar/1.tint2rc &
tint2 -c /home/kappcy/.config/tint2/static/polybar/2.tint2rc &
