#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Terminate already running modules
killall -q bspwm_states.sh xtitle.sh

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bars
polybar -c $HOME/.config/bspwm/polybar/config right -r &
polybar -c $HOME/.config/bspwm/polybar/config left -r &
[[ $(nvidia-settings --query CurrentMetaMode) = *DPY-2* ]] && \
polybar -c $HOME/.config/bspwm/polybar/config tv -r &

sleep 1
# Start IPC Modules
$HOME/.config/bspwm/polybar/ipc_modules/bspwm_states.sh start &
$HOME/.config/bspwm/polybar/ipc_modules/xtitle.sh start &
