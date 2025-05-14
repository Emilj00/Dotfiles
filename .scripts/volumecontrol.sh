#!/bin/bash

# Define the step for volume adjustment (in percentage)
step=5
max_volume=100
min_volume=0

# Get the current volume percentage
current_volume=$(pamixer --get-volume)

case $1 in
    raise)
        new_volume=$((current_volume + step))
        if [ "$new_volume" -gt "$max_volume" ]; then
            new_volume=$max_volume
        fi
        pamixer --set-volume "$new_volume"
        echo "Volume raised to $new_volume%"
        ;;
    lower)
        new_volume=$((current_volume - step))
        if [ "$new_volume" -lt "$min_volume" ]; then
            new_volume=$min_volume
        fi
        pamixer --set-volume "$new_volume"
        echo "Volume lowered to $new_volume%"
        ;;
    mute)
		pamixer --toggle-mute
        echo "Audio muted/unmuted."
        ;;
    mute-mic)
    	pamixer --toggle-mute --input
        echo "Microphone muted/unmuted."
        ;;
    *)
        echo "Usage: $0 {raise|lower|mute|mute-mic}"
        exit 1
        ;;
esac
