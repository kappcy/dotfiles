#----------Desktop----------

sleep 1 && nitrogen --restore & #background
sleep 3 && ~/scripts/xwinwrap-wallpaper.sh & #animated_wallpaper

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & #polkit
/usr/lib/xfce4/notifyd/xfce4-notifyd & #notifications
ckb-next -b & #Corsair_Mouse
numlockx on & #numlock
compton & #compositor
quicktile --daemonize & #tiling
~/.config/polybar/launchall.sh & #panels
~/scripts/openbox/screensaver.sh & #my_screen-blanking_script

#----------SysTray----------

redshift-gtk & #nightmode
nm-applet & #network
clipit & #clipboard_manager
shutter --min_at_startup & #screencapture_utility

#-----------apps------------

discord &
steam -silent &
pcmanfm &
termite &
vivaldi-stable &
sleep 3 && ~/scripts/autotile & #my_handy_startup_tiled_script
