#!/usr/bin/env bash

## Author : Aditya Shakya (adi1090x)
## Updated by: ChatGPT

dir="$HOME/.config/rofi/launcher.rasi"

# Check if Rofi window is active (requires xdotool)
if command -v xdotool > /dev/null; then
    rofi_window=$(xdotool search --name "rofi" 2>/dev/null)

    if [ -n "$rofi_window" ]; then
        # If found, kill Rofi
        pkill rofi
    else
        # Launch Rofi
        rofi -show drun -theme "$dir" &
    fi

else
    # Fallback using pkill + pgrep (less reliable)
    if pgrep -x rofi > /dev/null; then
        pkill rofi
    else
        rofi -show drun -theme "$dir" &
    fi
fi
