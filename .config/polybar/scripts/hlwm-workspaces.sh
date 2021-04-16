#!/usr/bin/env bash

selected_monitor=$MONITOR

###############################################################################
# Theme
###############################################################################
# Show tags names
#tag_label='name'
#
#default_bg='#434C5E'
#default_fg='#D8DEE9'
#
#active_bg='#81A1C1'
#active_fg='#2E3440'
#
#not_focused_bg='#81A1C1'
#not_focused_fg='#2E3440'
#
#occupied_bg='#4C566A'
#occupied_fg='#D8DEE9'
#
#urgent_bg='#EBCB8B'
#urgent_fg='#2E3440'

# Show icons for tags
tag_label='icon'

tag_icon_default=''
tag_icon_active=''
tag_icon_urgent=''
tag_icon_occupied=''

default_bg='#3B4252'
default_fg='#81A1C1'

active_bg=$default_bg
active_fg='#A3BE8C'

not_focused_bg=$default_bg
not_focused_fg='#B48EAD'

occupied_bg=$default_bg
occupied_fg='#81A1C1'

urgent_bg=$default_bg
urgent_fg='#EBCB8B'

###############################################################################
# format tags
###############################################################################

format_tag() {
  tag_status=$1
  tag_name=$2

  # default format
  echo "%{B${default_bg}}%{F${default_fg}}"

  case ${tag_status} in
  '#')
    # # the tag is viewed on the specified MONITOR and it is focused.
    echo "%{B${active_bg}}%{F${active_fg}}"
    ;;
  '+')
    # + the tag is viewed on the specified MONITOR, but this monitor is not focused.
    echo "%{B${not_focused_bg}}%{F${not_focused_fg}}"
    ;;
  '-')
    # - the tag is viewed on a different MONITOR, but this monitor is not focused.
    echo "%{B${occupied_bg}}%{F${occupied_fg}}"
    ;;
  '%')
    # % the tag is viewed on a different MONITOR and it is focused.
    echo "%{B${occupied_bg}}%{F${occupied_fg}}"
    ;;
  ':')
    # : the tag is not empty
    echo "%{B${occupied_bg}}%{F${occupied_fg}}"
    ;;
  '!')
    # ! the tag contains an urgent window
    echo "%{B${urgent_bg}}%{F${urgent_fg}}"
    ;;
  *)
    # . the tag is empty
    # echo "%{F-}%{B-}" # Add your formatting tags for empty B8B'
    ;;
  esac

  echo "%{A1:herbstclient chain , focus_monitor $selected_monitor , use ${tag_name}:}"

  case ${tag_label} in
  'name')
    echo " ${tag_name} "
    ;;
  'icon')
    case ${tag_status} in
    '#' | '+')
      echo " $tag_icon_active "
      ;;
    '-' | '%')
      echo " $tag_icon_active "
      ;;
    ':')
      echo " $tag_icon_occupied "
      ;;
    '!')
      echo " $tag_icon_urgent "
      ;;
    *)
      echo " $tag_icon_default "
      ;;
    esac
    ;;
  esac

  echo "%{A -u -o F- B-}"
}

herbstclient --idle "tag_*" 2>/dev/null | {

  while true; do
    # Read tags into $tags as array
    IFS=$'\t' read -ra tags <<<"$(herbstclient tag_status "$selected_monitor")"
    {
      for i in "${tags[@]}"; do
        # Read the prefix from each tag and render them according to that prefix
        format_tag "${i:0:1}" "${i:1}"
      done

      echo "%{F-}%{B-}" # reset format
    } | tr -d "\n"

    echo

    # wait for next event from herbstclient --idle
    read -r || break
  done
} 2>/dev/null
