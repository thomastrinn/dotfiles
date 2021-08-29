#!/usr/bin/bash
# Rename herbstluftwm monitor names, use the name from xrandr

if type "xrandr"; then
  index=0
  for monitor in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    herbstclient rename_monitor $index "$monitor"
    index=$((index+1))
  done
fi