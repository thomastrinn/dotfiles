#!/usr/bin/env bash

ANS=$(echo "Shutdown|Reboot|Lock|Logout" | \
    rofi -sep "|" -dmenu -i -p 'System ' "" -width 20 \
    -hide-scrollbar -eh 1 -line-padding 4 -padding 5 -lines 4)
case "$ANS" in
    *Lock) lockscreen -- scrot ;;
    *Logout) loginctl terminate-session $(loginctl session-status | head -n 1 | awk '{print $1}') ;;
    *Reboot) systemctl reboot ;;
    *Shutdown) systemctl poweroff
esac

exit 0

