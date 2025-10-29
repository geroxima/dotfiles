#!/bin/bash

# Show the menu using wofi
CHOICE=$(echo -e "Sleep\nPoweroff\nReboot\nLogout" | wofi --dmenu --height 200 --width 300 --prompt "󰐥 Choose an action:")

# Perform the selected action
case $CHOICE in
    "Sleep")
        systemctl suspend
        ;;
    "Poweroff")
        systemctl poweroff
        ;;
    "Reboot")
        systemctl reboot
        ;;
    "Logout")
        hyprctl dispatch exit
        ;;
    *)
        echo "No action selected."
        ;;
esac
