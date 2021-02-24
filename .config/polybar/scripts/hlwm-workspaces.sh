#!/usr/bin/env bash

selected_monitor=$MONITOR

###############################################################################
# Colors
###############################################################################
default_bg='#434C5E'
default_fg='#D8DEE9'

selected_tag_bg='#88C0D0'
selected_tag_fg='#2E3440'

active_tag_bg='#4C566A'
active_tag_fg='#D8DEE9'

urgent_tag_bg='#EBCB8B'
urgent_tag_fg='#2E3440'

not_empthy_tag_bg='#4C566A'
not_empthy_tag_fg='#D8DEE9'

###############################################################################
# format tags
###############################################################################
herbstclient --idle "tag_*" 2>/dev/null | {

    while true; do
        # Read tags into $tags as array
        IFS=$'\t' read -ra tags <<< "$(herbstclient tag_status $selected_monitor)"
        {
            for i in "${tags[@]}" ; do
                # Read the prefix from each tag and render them according to that prefix
                echo "%{B${default_bg}}%{F${default_fg}}"
                case ${i:0:1} in
                    '#')
			            # # the tag is viewed on the specified MONITOR and it is focused.
                        echo "%{B${selected_tag_bg}}%{F${selected_tag_fg}}"
	                    ;;
		            '+')
            			# + the tag is viewed on the specified MONITOR, but this monitor is not focused.
                        echo "%{B${selected_tag_bg}}%{F${selected_tag_fg}}"
            			;;
                    '-')
		                # - the tag is viewed on a different MONITOR, but this monitor is not focused.
                        echo "%{B${active_tag_bg}}%{F${active_tag_fg}}"
		                ;;
		            '%')
			            # % the tag is viewed on a different MONITOR and it is focused.
                        echo "%{B${active_tag_bg}}%{F${active_tag_fg}}"
			            ;;
                    ':')
                        # : the tag is not empty
                        echo "%{B${not_empthy_tag_bg}}%{F${not_empthy_tag_fg}}"
			            ;;
                    '!')
                        # ! the tag contains an urgent window
			            echo "%{B${urgent_tag_bg}}%{F${urgent_tag_fg}}"
                        ;;
                    *)
                        # . the tag is empty
                        # echo "%{F-}%{B-}" # Add your formatting tags for empty workspaces
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
