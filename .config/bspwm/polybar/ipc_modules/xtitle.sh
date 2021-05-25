#!/bin/bash

get_info() {
	xid=$(bspc query -N -n .active -m "$1" 2>/dev/null)
	[[ -n $xid ]] && title="$(xtitle "$xid")" || title=null
	read -rt "0.04" <> <(:)
}

update() {
	get_info "$1"
	title=${title//[^[:alnum:]]/SC}
	title_list+=("$1"'=''"'"$title"'"')
	[[ ${last_title_list[*]} != *"$1"'=''"'"$title"'"'* ]] && \
	[[ ${title_list[*]} = *"$1"'=''"'$title'"'* ]] && \
	polybar-msg hook xtitle_"$2" 1
}

case "$1" in
	start)
		xtitle -s | while read -r; do
			unset title_list
			update DVI-D-0 right
			update HDMI-0 left
			update DP-0 tv
			last_title_list=("${title_list[@]}")
		done
	;;
	set_title)
		get_info "$2"
		[[ -n $xid ]] && {
			focus_monitor="bspc monitor pointed -f"
			echo -ne "%{A1:$focus_monitor:}"
			echo -ne "%{A2:$focus_monitor; bspc node -c:}"
			[[ "${#title}" -gt "60" ]] && \
			title="${title:0:60}..."
			echo -ne "$title"
			echo -ne "%{A}%{A}"
		} || echo -ne " "
	;;
esac
