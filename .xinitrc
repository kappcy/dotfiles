XDG_RUNTIME_DIR=/run/user/kappcy paplay /usr/share/sounds/freedesktop/stereo/complete.oga
pactl upload-sample /usr/share/sounds/freedesktop/stereo/bell.oga x11-bell
pactl load-module module-x11-bell sample=x11-bell display=$DISPLAY

xbindkeys

exec openbox-session

