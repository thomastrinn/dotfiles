#!/usr/bin/env bash

selected_monitor=$MONITOR

modul_bg='#3B4252'
foreground='#D8DEE9'
background='#2E3440'
highlight='#88C0D0'
urgent='#EBCB8B'

herbstclient --idle "tag_*" 2>/dev/null | {

    while true; do
        # Read tags into $tags as array
        IFS=$'\t' read -ra tags <<< "$(herbstclient tag_status $selected_monitor)"
        {
            for i in "${tags[@]}" ; do
                # Read the prefix from each tag and render them according to that prefix
                echo "%{B${modul_bg}}"
                case ${i:0:1} in
                    '#')
			            # # the tag is viewed on the specified MONITOR and it is focused.
                        echo "%{B${highlight}}%{F${background}}"
	                    ;;
		            '+')
            			# + the tag is viewed on the specified MONITOR, but this monitor is not focused.
                        echo "%{u${highlight}}%{+u}"
            			;;
                    '-')
		                # - the tag is viewed on a different MONITOR, but this monitor is not focused.
                        echo "%{u${highlight}}%{+u}"
		                ;;
		            '%')
			            # % the tag is viewed on a different MONITOR and it is focused.
                        echo "%{u${highlight}}%{+u}"
			            ;;
                    ':')
                        # : the tag is not empty
                        echo "%{o${highlight}}%{+o}"
			            ;;
                    '!')
                        # ! the tag contains an urgent window
			            echo "%{B${urgent}}%{F${background}}"
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
