#!/usr/bin/env bash

hc() {
    herbstclient "$@"
}

# set panel height on each monitor
panel_height=52
for monitor in $(hc list_monitors | cut -d ':' -f1) ; do
    hc pad $monitor $panel_height
done

# lauch polybar
~/.config/polybar/launch.sh &
