#!/bin/sh

# get display name and connection state
display_info=$( xrandr --query | grep -E "( connected)|( disconnected)" | cut -d " " -f1,2 | sed -z 's/\n/,/g;s/,$/\n/' )

echo "display info: '$display_info'"

# read to an array
readarray -td, displays <<<"$display_info,"; unset 'displays[-1]'; declare -p displays;

# print displays:
for display in "${displays[@]}"; do
    echo "display: '$display'"
done

if [[ ${#displays[@]} = 4 ]]; then
    if [[ $( echo "${displays[0]}" | cut -d " " -f2 ) = "connected" ]]; then
        ~/.screenlayout/work-layout.sh
    else
        xrandr --output HDMI-1 --off --output HDMI-2 --mode 1920x1200 --pos 0x0 --rotate normal --output DP-1 --primary --mode 1920x1200 --pos 1920x0 --rotate normal --output HDMI-3 --off
    fi
fi
