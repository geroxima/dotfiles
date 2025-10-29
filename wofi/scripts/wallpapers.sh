#!/bin/bash

# Directory containing wallpapers
WALLPAPER_DIR="$HOME/Pictures/Wallpapers"

# Check if the wallpaper directory exists
if [ ! -d "$WALLPAPER_DIR" ]; then
    echo "Wallpaper directory not found: $WALLPAPER_DIR"
    exit 1
fi

# Use wofi to select a wallpaper
SELECTED=$(ls "$WALLPAPER_DIR" | wofi --dmenu --allow-images --prompt "Select a wallpaper:")

# Check if a selection was made
if [ -z "$SELECTED" ]; then
    echo "No wallpaper selected. Exiting."
    exit 0
fi

# Full path to the selected wallpaper
WALLPAPER_PATH="$WALLPAPER_DIR/$SELECTED"

# Read the hyprpaper template file
WAL_TPL=$(cat "$HOME/.config/hypr/hyprpaper.tpl")

# Replace the placeholder with the selected wallpaper path
OUTPUT="${WAL_TPL//WALLPAPER/$WALLPAPER_PATH}"

# Write the updated configuration to hyprpaper.conf
echo "$OUTPUT" > "$HOME/.config/hypr/hyprpaper.conf"

# Restart hyprpaper to apply the new wallpaper
echo ":: Restarting hyprpaper"
killall hyprpaper
hyprpaper &
