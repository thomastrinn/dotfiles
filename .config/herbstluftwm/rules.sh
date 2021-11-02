#!/usr/bin/env bash

hc() {
    herbstclient "$@"
}

hc unrule -F

hc rule focus=on # normally focus new clients
hc rule floatplacement=center

hc rule windowtype~'_NET_WM_WINDOW_TYPE_(DIALOG|UTILITY|SPLASH)' floating=on
hc rule windowtype='_NET_WM_WINDOW_TYPE_DIALOG' focus=on
hc rule windowtype~'_NET_WM_WINDOW_TYPE_(NOTIFICATION|DOCK|DESKTOP)' manage=off

hc rule instance='gnome-screenshot'     floating=on
hc rule instance='pamac-manager'        floating=on
hc rule instance='lxpolkit'             floating=on
hc rule instance='pavucontrol'          floating=on
hc rule instance='transmission-gtk'     floating=on
hc rule instance='vlc'                  floating=on
hc rule instance='protonvpn'            floating=on
hc rule title='Brave'                   floating=on

hc rule title~'.*screen share'          floating=on
hc rule title='Slack'                   floating=on
hc rule title~'Slack \| Calling.*'      floating=on
hc rule title~'.*is sharing.*'          floating=on

hc rule title='calcurse'                tag=calendar
hc rule instanse='signal'               tag=signal
