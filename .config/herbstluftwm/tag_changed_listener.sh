#!/usr/bin/env bash

herbstclient --idle "tag_changed*" 2>/dev/null | {
    while true; do
        IFS= read event
        echo "event: '$event'"
        tag_name=$( echo "$event" | sed -e "s/\t/,/g" | cut -d "," -f2)
        echo "tag name: '$tag_name'"

        case ${tag_name} in
            'calendar')
                [ -z "$(pgrep 'calcurse')" ] && alacritty --title 'calcurse' --command calcurse &
                echo "calendar"
                ;;
            'signal')
                [ -z "$(pgrep 'signal-desktop')" ] && signal-desktop &
                echo "signal"
                ;;
            *)
                ;;
        esac

        # wait fo next event from herbstclient --idle
        read -r || break
    done
} 2>/dev/null
