#!/usr/bin/env bash

hc() {
    herbstclient "$@"
}

# remove all existing keybindings
hc keyunbind --all

Mod=Mod4   # Use the super key as the main modifier

myTerminal=alacritty

hc keybind $Mod-Shift-q quit                # Quits herbstluftwm
hc keybind $Mod-Shift-r reload              # Executes the autostart file
#hc keybind $Mod-Shift-c close              # Closes the specified window gracefully or the focused window if none is given explicitly.
hc keybind $Mod-Shift-c close_or_remove     # Closes the focused window or removes the current frame if no window is focused. In floating mode, this acts as the close command.
#hc keybind $Mod-Shift-c close_and_remove   # Closes the focused window and removes the current frame if no other window is present in that frame. In floating mode, this acts as the close command.

bravePersonalProfile="--profile-directory=Default"
braveParams="--use-gl=desktop --enable-features=VaapiVideoDecoder"

# launch apps
hc keybind $Mod-Return          spawn "${myTerminal}"                       # start terminal
hc keybind $Mod-Shift-Return    spawn applauncher                           # start app launcher

hc keybind $Mod-Mod1-b          spawn brave ${braveParams} 
#hc keybind $Mod-Mod1-b          spawn brave ${bravePersonalProfile} ${braveParams}     # start browser
hc keybind $Mod-Mod1-w          spawn brave --profile-directory='Profile 1' ${braveParams}          # start work browser
hc keybind $Mod-Mod1-g          spawn brave --guest ${braveParams}                      # start guest browser session
hc keybind $Mod-Mod1-s          spawn slack                                 # start slack
hc keybind $Mod-Mod1-v          spawn virt-manager                          # start virt-manager
hc keybind Print                spawn gnome-screenshot -i                   # start screenshot
hc keybind $Mod-Mod1-t          spawn transmission-gtk -m                   # start torrent app
hc keybind $Mod-Mod1-f          spawn nautilus                              # start file manager
hc keybind $Mod-Mod1-u          spawn pamac-manager                         # start update/package manager
hc keybind $Mod-Escape          spawn powermenu                             # open power menu
hc keybind XF86Calculator       spawn calclauncher                          # start calculator
hc keybind $Mod-Mod1-space      spawn side_panel_toggle                     # toggles eww side panel

hc keybind $Mod-Mod1-c          spawn ~/.config/herbstluftwm/scripts/scratchpad.sh calendar

hc keybind $Mod-Mod1-m          spawn ~/.config/herbstluftwm/scripts/scratchpad.sh signal

hc keybind $Mod-0               spawn ~/.config/herbstluftwm/scripts/maximize.sh

# Audio cntrol
hc keybind XF86AudioRaiseVolume spawn pulseaudio-ctl up
hc keybind XF86AudioLowerVolume spawn pulseaudio-ctl down
hc keybind XF86AudioMute        spawn pulseaudio-ctl mute

# Media control
hc keybind XF86AudioPlay        spawn playerctl --all-players play-pause
hc keybind XF86AudioNext        spawn playerctl --all-players next
hc keybind XF86AudioPrev        spawn playerctl --all-players previous
hc keybind XF86AudioStop        spawn playerctl --all-players stop

# basic movement in tiling and floating mode
# focusing clients
hc keybind $Mod-Left  focus left
hc keybind $Mod-Down  focus down
hc keybind $Mod-Up    focus up
hc keybind $Mod-Right focus right
hc keybind $Mod-h     focus left
hc keybind $Mod-j     focus down
hc keybind $Mod-k     focus up
hc keybind $Mod-l     focus right

# moving clients in tiling and floating mode
hc keybind $Mod-Shift-Left  shift left
hc keybind $Mod-Shift-Down  shift down
hc keybind $Mod-Shift-Up    shift up
hc keybind $Mod-Shift-Right shift right
hc keybind $Mod-Shift-h     shift left
hc keybind $Mod-Shift-j     shift down
hc keybind $Mod-Shift-k     shift up
hc keybind $Mod-Shift-l     shift right

hc set default_frame_layout grid   # grid - clients are arranged in an almost quadratic grid

# splitting frames
# create an empty frame at the specified direction
#hc keybind $Mod-u       split   bottom  0.5
#hc keybind $Mod-o       split   right   0.5
hc keybind $Mod-u       and , split bottom 0.5 , focus down
hc keybind $Mod-o       and , split right  0.5 , focus right
# let the current frame explode into subframes
hc keybind $Mod-Control-space split explode

# resizing frames and floating clients
resizestep=0.02
hc keybind $Mod-Control-h       resize left +$resizestep
hc keybind $Mod-Control-j       resize down +$resizestep
hc keybind $Mod-Control-k       resize up +$resizestep
hc keybind $Mod-Control-l       resize right +$resizestep
hc keybind $Mod-Control-Left    resize left +$resizestep
hc keybind $Mod-Control-Down    resize down +$resizestep
hc keybind $Mod-Control-Up      resize up +$resizestep
hc keybind $Mod-Control-Right   resize right +$resizestep

# tags
tag_names=( {1..9} )
tag_keys=( {1..9} 0 )

hc rename default "${tag_names[0]}" || true
for i in "${!tag_names[@]}" ; do
    hc add "${tag_names[$i]}"
    key="${tag_keys[$i]}"
    if ! [ -z "$key" ] ; then
        hc keybind "$Mod-$key" use_index "$i"
        hc keybind "$Mod-Shift-$key" move_index "$i"
    fi
done

# cycle through tags
hc keybind $Mod-period use_index +1 --skip-visible
hc keybind $Mod-comma  use_index -1 --skip-visible

# layouting
hc keybind $Mod-r remove
hc keybind $Mod-s floating toggle
hc keybind $Mod-f fullscreen toggle
hc keybind $Mod-Shift-f set_attr clients.focus.floating toggle
hc keybind $Mod-Shift-m set_attr clients.focus.minimized true
hc keybind $Mod-Control-m jumpto last-minimized
hc keybind $Mod-p pseudotile toggle
# The following cycles through the available layouts within a frame, but skips
# layouts, if the layout change wouldn't affect the actual window positions.
# I.e. if there are two windows within a frame, the grid layout is skipped.
hc keybind $Mod-space                                                           \
            or , and . compare tags.focus.curframe_wcount = 2                   \
                     . cycle_layout +1 vertical horizontal max vertical grid    \
               , cycle_layout +1

# mouse
hc mouseunbind --all
hc mousebind $Mod-Button1 move
hc mousebind $Mod-Button2 zoom
hc mousebind $Mod-Button3 resize

# focus
hc keybind $Mod-BackSpace   cycle_monitor

hc keybind $Mod-Mod1-1      focus_monitor 0
hc keybind $Mod-Mod1-2      focus_monitor 1
hc keybind $Mod-Mod1-3      focus_monitor 2

hc keybind $Mod-Tab         cycle_all +1
hc keybind $Mod-Shift-Tab   cycle_all -1
hc keybind $Mod-c cycle
hc keybind $Mod-i jumpto urgent
