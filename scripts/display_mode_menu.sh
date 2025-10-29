#!/bin/bash

# Define monitors
INTERNAL="eDP-1"
EXTERNAL="HDMI-A-2"

# Display settings
INTERNAL_RES="1920x1080@60.02000"
EXTERNAL_RES="1920x1080@61.01000"
SCALE="1"

# Wofi menu options
OPTION=$(printf "mirror\nextend\ncancel" | wofi --dmenu --prompt "Display Mode:" --width 300 --height 200)

case "$OPTION" in
  mirror)
    hyprctl dispatch dpms off "$EXTERNAL"
    sleep 0.5
    hyprctl dispatch dpms on "$EXTERNAL"
    hyprctl keyword monitor "$INTERNAL,$INTERNAL_RES,0x0,$SCALE,mirror,$EXTERNAL"
    hyprctl keyword monitor "$EXTERNAL,$EXTERNAL_RES,0x0,$SCALE"
    ;;

  extend)
    hyprctl dispatch dpms off "$EXTERNAL"
    sleep 0.5
    hyprctl dispatch dpms on "$EXTERNAL"
    hyprctl keyword monitor "$INTERNAL,$INTERNAL_RES,0x0,$SCALE"
    hyprctl keyword monitor "$EXTERNAL,$EXTERNAL_RES,1920x0,$SCALE"
    ;;

  cancel|"")
    exit 0
    ;;

  *)
    notify-send "Invalid option selected."
    exit 1
    ;;
esac

