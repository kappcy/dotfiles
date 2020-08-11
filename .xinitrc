#!/bin/sh
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
xset +fp /home/kappcy/.local/share/fonts
xset fp rehash
xsetroot -cursor_name left_ptr
systemctl --user import-environment DISPLAY

# my stuff
~/.config/bspwm/autostart.sh &

# fire it up
exec dbus-launch bspwm

