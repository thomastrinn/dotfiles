#!/usr/bin/env bash

hc() {
    herbstclient "$@"
}

# set background color
# xsetroot -solid '#2E3440' # use hsetroot instead (issue: https://github.com/chjj/compton/issues/162)
hsetroot -solid '#2E3440'

# set wallpapper
#feh --bg-fill ~/Pictures/wave-color-nord.png
feh --bg-fill ~/Pictures/mountains-1412683.jpg

# Theme
hc attr theme.tiling.reset 1
hc attr theme.floating.reset 1
hc set frame_border_active_color '#81A1C1'
hc set frame_border_normal_color '#2E3440'
hc set frame_bg_normal_color '#2E3440'
hc set frame_bg_active_color '#2E3440'
hc set frame_border_width 1
hc set frame_border_inner_width 0
hc set always_show_frame off
hc set frame_bg_transparent on
hc set frame_transparent_width 0
hc set frame_active_opacity 100
hc set frame_normal_opacity 0
hc set frame_gap 0

hc attr theme.active.color '#81A1C1'
hc attr theme.normal.color '#3B4252'
hc attr theme.urgent.color '#EBCB8B'
hc attr theme.inner_width 0
hc attr theme.inner_color black
hc attr theme.border_width 1
hc attr theme.floating.border_width 1
hc attr theme.floating.outer_width 0
hc attr theme.floating.outer_color black
hc attr theme.active.inner_color '#81A1C1'
hc attr theme.active.outer_color '#81A1C1'
hc attr theme.background_color '#2E3440'

hc set window_gap 0
hc set frame_padding 0
hc set smart_window_surroundings off
hc set smart_frame_surroundings on
hc set mouse_recenter_gap 100
hc set update_dragged_clients 1

