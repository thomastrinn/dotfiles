#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

if type "xrandr"; then
    primary_monitor=$(xrandr -q | grep " connected primary" | cut -d ' ' -f1)
    for m in $(xrandr --query | grep " connected" | cut -d ' ' -f1); do
        if [ $primary_monitor == $m ]; then
            MONITOR=$m polybar --reload hlwm-primary-bar &
        else
            MONITOR=$m polybar --reload hlwm-secondary-bar &
        fi
    done
else
  polybar --reload hlwm-main-bar &
fi
