#!/bin/bash
focus_monitor="bspc monitor pointed -f"

get_title() {
	xid=$(bspc query -N -n .active -m $1 2>/dev/null)
	title="$(xtitle $xid)"
	[[ -z $xid ]] && unset title
	read -t "0.02" <> <(:)
}

update() {
	focused_node="$(bspc query -N -n)"
	get_title $1
	active_list+=($1='"'$xid'"')
	[[ ${last_active_list[@]} != *$1='"'$xid'"'* ]] && \
	[[ ${active_list[@]} = *$1='"'$xid'"'* ]] && \
	polybar-msg hook xtitle_$2 1
}

case "$1" in
	start)
		xtitle -s | while read; do
			unset active_list
			update DVI-D-0 right
			update HDMI-0 left
			update DP-0 tv
			last_active_list=(${active_list[@]})
		done
	;;
	set_title)
		get_title $2
		[[ -z $xid ]] && exit
		echo -ne "%{A1:$focus_monitor:}"
		echo -ne "%{A2:$focus_monitor; bspc node $focused_node -c:}"
		echo -ne "%{T3}%{F#b8bb26}  %{F-}%{T-}"
		echo -ne "$title"
		echo -ne "%{A}%{A}"

	;;
esac
