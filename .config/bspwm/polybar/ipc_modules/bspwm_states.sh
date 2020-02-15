#!/bin/bash
focus_monitor="bspc monitor pointed -f"
monocle="%{T3}%{A1:$focus_monitor; bspc desktop -l next:} %{A} %{T-}"
tiled="%{T3}%{A1:$focus_monitor; bspc node -t tiled:} %{A} %{T-}"
floating="%{T3}%{A1:$focus_monitor; bspc node -t floating:} %{A}%{T-}"

icon_set() {
	chk=( T:TT T:TF T:E M:TT M:TF M:E )
	chk2=( 1 2 3 4 5 6 )
	for i in ${!chk[*]}; do
		[[ ${last_status_list[@]} != *$1=${chk[i]}* ]] && \
		[[ ${status_list[@]} = *$1=${chk[i]}* ]] && \
		polybar-msg hook bspwm_states_$2 ${chk2[i]}
	done
}

update() {
    [[ $status != *$1* ]] && return
    state=${status#*$1}; state=${state#*L}
    state=${state%%:[G|S|P|L|M|m]*}
	[[ $state != *:T* ]] && state="$state:E"
	status_list+=($1=$state)
	icon_set $1 $2
}

case "$1" in
	start)
		bspc subscribe report | while read; do
			unset status_list
			status=$(bspc wm -g)
			update DVI-D-0 right
			update HDMI-0 left
			update DP-0 tv
			last_status_list=${status_list[@]}
		done
        ;;
    tiled.tiled)
        echo -ne "$monocle"
        echo -ne "%{F#b8bb26}$tiled%{F-}"
        echo -ne "$floating"
        ;;
    tiled.floating)
        echo -ne "$monocle"
        echo -ne "$tiled"
        echo -ne "%{F#b8bb26}$floating%{F-}"
        ;;
    tiled.empty)
        echo -ne "$monocle"
        echo -ne "$tiled"
        echo -ne "$floating"
        ;;
    monocle.tiled)
        echo -ne "%{F#fb4934}$monocle%{F-}"
        echo -ne "%{F#b8bb26}$tiled%{F-}"
        echo -ne "$floating"
        ;;
    monocle.floating)
        echo -ne "%{F#fb4934}$monocle%{F-}"
        echo -ne "$tiled"
        echo -ne "%{F#b8bb26}$floating%{F-}"
        ;;
	monocle.empty)
        echo -ne "%{F#fb4934}$monocle%{F-}"
        echo -ne "$tiled"
        echo -ne "$floating"
        ;;
esac
