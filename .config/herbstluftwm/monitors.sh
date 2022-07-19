#!/usr/bin/bash

hc() {
    herbstclient "$@"
}

# configure displays
~/.config/herbstluftwm/display-settings.sh

# do multi monitor setup here, e.g.:
#hc set_monitors 1920x1200+0+0 1920x1200+1920+0 1920x1200+3840+0
# or simply:
hc detect_monitors

# Rename herbstluftwm monitor names, use the name from xrandr
# it will be used by polybar / hlwm-workspace.sh to show workspaces in polybar
#if type "xrandr"; then
  #index=0
  #for monitor in $(xrandr --query | grep " connected" | cut -d " " -f1); do
    #hc rename_monitor $index "$monitor"
    #index=$((index+1))
  #done
#fi
hc rename_monitor 0 DP-1
hc rename_monitor 1 HDMI-2

# focus primary monitor
if hc silent new_attr bool my_on_login_focus_primary_monitor ; then
    primary_monitor=$(xrandr -q | grep " connected primary" | cut -d ' ' -f1)
    if [ -n "$primary_monitor" ]; then
        hc chain , focus_monitor $primary_monitor , use_index 0
    fi
fi
