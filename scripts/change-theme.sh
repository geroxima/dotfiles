#!/bin/bash

selection=$(echo -e "dark Theme\nlight Theme" | wofi --dmenu --height 200 --width 300 --prompt "Choose a color scheme")

case $selection in
  "dark Theme")
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
    cp ~/.config/waybar/style-dark.css ~/.config/waybar/style.css
    ;;
  "light Theme")
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
    cp ~/.config/waybar/style-light.css ~/.config/waybar/style.css
    ;;
esac

killall waybar
waybar & disown

