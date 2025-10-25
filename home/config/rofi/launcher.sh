#!/usr/bin/env bash

## Author : Aditya Shakya (adi1090x)
## Updated by: ChatGPT

dir="$HOME/.config/rofi/launcher.rasi"

# Check if Rofi window is active (requires xdotool)
if pgrep -x rofi > /dev/null; then
    pkill rofi
else
    rofi -show drun -theme "$dir" &
fi
