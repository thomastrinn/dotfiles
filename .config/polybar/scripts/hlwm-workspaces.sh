#!/usr/bin/env bash

selected_monitor=$MONITOR

herbstclient --idle "tag_*" 2>/dev/null | {

    while true; do
        # Read tags into $tags as array
        IFS=$'\t' read -ra tags <<< "$(herbstclient tag_status $selected_monitor)"
        {
            for i in "${tags[@]}" ; do
            # Read the prefix from each tag and render them according to that prefix
                case ${i:0:1} in
                    '#')
			# the tag is viewed on the focused monitor
			# TODO Add your formatting tags for focused workspaces
			echo "%{R}"
	                ;;
		    '+')
			# the tag is viewed on the specified MONITOR, but this monitor is not focused.
			# TODO Add your formatting tags for viewed but not focused workspaces
			echo "%{R}"
			;;
		    '%')
			# the tag is viewed on a different MONITOR and it is focused.
			# TODO Add your formatting tags for viewed, focused tag but not selected monitor
                        echo "%{B#3A475F}"
			;;
                    ':')
                        # : the tag is not empty
                        # TODO Add your formatting tags for occupied workspaces
			echo "%{B#3A475F}"
			;;
                    '!')
                        # ! the tag contains an urgent window
                        # TODO Add your formatting tags for workspaces with the urgent hint
			echo "%{F#202734}%{B#FFA759}"
                        ;;
                    '-')
                        # - the tag is viewed on a monitor that is not focused
                        # TODO Add your formatting tags for visible but not focused workspaces
			echo "%{B#3A475F}"
			;;
                    *)
                        # . the tag is empty
                        # There are also other possible prefixes but they won't appear here
                        echo "%{F-}%{B-}" # Add your formatting tags for empty workspaces
                        ;;
                esac

	        echo "%{A1:herbstclient chain , focus_monitor $selected_monitor , use ${i:1}:} ${i:1} %{A -u -o F- B-}"
            done

	    echo "%{F-}%{B-}"
        } | tr -d "\n"

    echo

    # wait for next event from herbstclient --idle
    read -r || break
done
} 2>/dev/null
