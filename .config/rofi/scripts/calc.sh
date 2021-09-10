#!/usr/bin/env bash
# Do live calculations with rofi (https://github.com/svenstaro/rofi-calc)

LC_NUMERIC=hu_HU.UTF-8 rofi -theme ~/.config/rofi/nord-calc.rasi \
							-modi calc \
							-show calc \ 
							-no-show-match \
							-no-sort
