#!/usr/bin/env bash

rofi_command="rofi -theme powermenu.rasi"

### Options ###
power_off=""
reboot=""
lock=""
suspend="鈴"
log_out=""

# Variable passed to rofi
options="$power_off\n$reboot\n$lock\n$suspend\n$log_out"

chosen="$(echo -e "$options" | $rofi_command -dmenu)"
case $chosen in
    $power_off)
        systemctl poweroff
        ;;
    $reboot)
        systemctl reboot
        ;;
    $lock)
        loginctl lock-session ${XDG_SESSION_ID-}
        ;;
    $suspend)
        systemctl suspend
        ;;
    $log_out)
        loginctl terminate-session ${XDG_SESSION_ID-}
        ;;
esac

