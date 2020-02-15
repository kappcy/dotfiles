#----------Desktop----------

sleep 1 && nitrogen --restore & #background
sleep 3 && ~/scripts/xwinwrap-wallpaper.sh & #animated_wallpaper
xdotool mousemove --sync 2880 540

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & #polkit
/usr/lib/xfce4/notifyd/xfce4-notifyd & #notifications
ckb-next -b & #Corsair_Mouse
numlockx on & #numlock
compton & #compositor
quicktile --daemonize & #tiling
~/.config/polybar/launchall.sh & #panels
~/scripts/screenblank & #my_screen-blanking_script
~/scripts/bg_watcher & #checks stuff. It's a work in progress

#----------SysTray----------

redshift-gtk & #nightmode
nm-applet & #network
clipit & #clipboard_manager
shutter --min_at_startup & #screencapture_utility

#-----------apps------------

discord-canary &
steam -silent &
pcmanfm &
termite &
vivaldi-stable &
sleep 3 && ~/scripts/autotile & #my_handy_startup_tiled_script
