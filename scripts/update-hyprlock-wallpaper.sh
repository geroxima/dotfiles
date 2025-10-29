#!/bin/bash

# Full path to wallpaper passed as first argument
src="$1"
dst="$HOME/.cache/hyprlock_wallpaper.png"

# Expand and validate source path
[ -f "$src" ] || exit 1

# Only update if wallpaper changed
[ -f "$dst" ] && cmp -s "$src" "$dst" && exit 0

# Apply blur and save as destination
ffmpeg -y -i "$src" -vf "gblur=sigma=30" "$dst"
