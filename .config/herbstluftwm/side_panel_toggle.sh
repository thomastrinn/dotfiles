#!/bin/sh

hc() {
    herbstclient "$@"
}

MONITOR=1

SIDE_PANEL_WIDTH=360

PADUP=$(hc list_padding ${MONITOR} | awk '{print $1}')
PADRIGHT=$(hc list_padding ${MONITOR} | awk '{print $2}')
PADDOWN=$(hc list_padding ${MONITOR} | awk '{print $3}')
PADLEFT=$(hc list_padding ${MONITOR} | awk '{print $4}')

if [[ "$PADRIGHT" == "0"  ]]; then
    hc pad $MONITOR $PADUP $SIDE_PANEL_WIDTH $PADDOWN $PADLEFT
    eww open side-panel
else
    hc pad $MONITOR $PADUP 0 $PADDOWN $PADLEFT
    eww close side-panel
fi
