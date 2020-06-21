#!/bin/sh

###### setup #####

sxhkd & # hotkeys
numlockx on & # numlock
xsetroot -cursor_name left_ptr & # set mouse pointer
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & # polkit
# /usr/lib/xfce4/notifyd/xfce4-notifyd & # notifications
compton --respect-prop-shadow & # compositor
$HOME/.config/bspwm/polybar/launch.sh

##### Tray #####

ckb-next -b & # Corsair_Mouse
# redshift-gtk & # nightmode
nm-applet & # network
blueberry-tray & # bluetooth
clipit & # clipboard_manager
shutter --min_at_startup & # screencapture_utility

##### misc #####

xbindkeys # volume slider on Turtlebeach Headset


# connect btspeakers
(
	sleep 2
	/bin/bluetoothctl connect 00:02:3C:60:F4:D4
) &

# mouse fix... Thanks Corsair. -_-
(
    echo idle > /dev/input/ckb1/cmd
    echo idle > /dev/input/ckb2/cmd
    echo active > /dev/input/ckb1/cmd
    echo active > /dev/input/ckb2/cmd
) &

##### scripts #####

$HOME/scripts/screenblank & # my_screen-blanking_script
$HOME/scripts/bg_watcher & # checks for bg stuff
sleep 3 && $HOME/scripts/xwinwrap-wallpaper.sh & # animated_wallpaper

##### Apps #####

discord-canary &
steam &
(bspc rule -a \* -o state=tiled && pcmanfm) &
alacritty &
vivaldi-stable &
