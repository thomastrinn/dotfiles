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
			            # # the tag is viewed on the specified MONITOR and it is focused.
			            echo "%{B#BAE67E}%{F#202734}"
	                    ;;
		            '+')
            			# + the tag is viewed on the specified MONITOR, but this monitor is not focused.
			            echo "%{B#BAE67E}%{F#202734}"
            			;;
                    '-')
		                # - the tag is viewed on a different MONITOR, but this monitor is not focused.
		                echo "%{B#5CCFE6}%{F#202734}"
		                ;;
		            '%')
			            # % the tag is viewed on a different MONITOR and it is focused.
                        echo "%{B#5CCFE6}%{F#202734}"
			            ;;
                    ':')
                        # : the tag is not empty
			            echo "%{B#3A475F}"
			            ;;
                    '!')
                        # ! the tag contains an urgent window
			            echo "%{B#FFA759}%{F#202734}"
                        ;;
                    *)
                        # . the tag is empty
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
