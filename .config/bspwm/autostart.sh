#!/bin/sh

###### setup #####

sxhkd & # hotkeys
numlockx on & # numlock
xsetroot -cursor_name left_ptr & # set mouse pointer
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & # polkit
compton --respect-prop-shadow & # compositor
nitrogen --restore & # set wallpaper
$HOME/.config/bspwm/polybar/launch.sh

##### Notifications  #####

bg=$(xrdb ~/.Xresources -query all | grep background | awk '{print $2}')
fg=$(xrdb ~/.Xresources -query all | grep foreground | awk '{print $2}')

dunst \
	-lb "$bg" -nb "$bg" -cb "$bg" -lf "$fg" -bf "$fg" -cf "$fg" -nf "$fg" \
	-fn "PragmataPro Mono 10" \
	-s -geometry "350x40-8+44" \
	-format "<b>%s</b>\n%b" \
	-alignment center \
	-icon_position left \
	-icon_path "/usr/share/icons/Vimix-dark/16/status/:/usr/share/icons/Vimix-dark/16/devices/" \
	-transparency 20 \
	-key "ctrl+space" -all_key "space" \
	-padding 20 -horizontal_padding 20 &

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

sleep 2 && /bin/bluetoothctl connect 00:02:3C:60:F4:D4 &

# mouse fix... Thanks Corsair. -_-

echo idle > /dev/input/ckb1/cmd
echo idle > /dev/input/ckb2/cmd
echo active > /dev/input/ckb1/cmd
echo active > /dev/input/ckb2/cmd

##### scripts #####

$HOME/scripts/screenblank & # my_screen-blanking_script
# $HOME/scripts/bg_watcher & # checks for bg stuff
# sleep 3 && $HOME/scripts/xwinwrap-wallpaper.sh & # animated_wallpaper

##### Apps #####

discord &
steam &
alacritty &
vivaldi-stable &
