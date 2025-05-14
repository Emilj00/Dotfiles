#!/bin/bash
find /usr/share/applications ~/.local/share/applications -name "*.desktop" | while read -r desktop_file; do
    app_name=$(grep -m 1 "^Name=" "$desktop_file" | cut -d'=' -f2)
    echo "$app_name:$desktop_file"
done | wmenu -p "Select Application" | cut -d':' -f2 | xargs gtk-launch
