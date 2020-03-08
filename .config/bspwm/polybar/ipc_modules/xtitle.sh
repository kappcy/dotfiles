#!/bin/bash
focus_monitor="bspc monitor pointed -f"

get_info() {
	xid=$(bspc query -N -n .active -m $1 2>/dev/null)
	title="$(xtitle $xid)"
	[[ -z $xid ]] && title=null
	read -t "0.04" <> <(:)
}

update() {
	get_info $1
	title=${title//[^[:alnum:]]/SC}
	title_list+=($1='"'$title'"')
	[[ ${last_title_list[@]} != *$1='"'$title'"'* ]] && \
	[[ ${title_list[@]} = *$1='"'$title'"'* ]] && \
	polybar-msg hook xtitle_$2 1
}

case "$1" in
	start)
		xtitle -s | while read; do
			unset title_list
			update DVI-D-0 right
			update HDMI-0 left
			update DP-0 tv
			last_title_list=(${title_list[@]})
		done
	;;
	set_title)
		get_info $2
		[[ -n $xid ]] && {
			echo -ne "%{A1:$focus_monitor:}"
			echo -ne "%{A2:$focus_monitor; bspc node -c:}"
			echo -ne "%{T3}%{F#b8bb26}  %{F-}%{T-}"
			[[ "${#title}" -gt "120" ]] && \
			title="${title:0:120}..."
			echo -ne "$title"
			echo -ne "%{A}%{A}"
		} || echo -ne "%{T3}%{F#928374}  %{F-}%{T-}"
	;;
esac
