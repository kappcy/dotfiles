#!/bin/sh

###### setup #####

sxhkd & # hotkeys
numlockx on & # numlock
xsetroot -cursor_name left_ptr & # set mouse pointer
picom & # compositor
dunst & # notifications
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & # polkit
nitrogen --restore & # set wallpaper
$HOME/.config/bspwm/polybar/launch.sh
$HOME/scripts/screenblank & # my_screen-blanking_script

##### Tray #####

# redshift-gtk & # nightmode
nm-applet & # network
blueberry-tray & # bluetooth
clipit & # clipboard_manager
shutter --min_at_startup & # screencapture_utility
ckb-next -b &

##### Apps #####

alacritty &
brave &
