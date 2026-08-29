#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/Pictures/Wallpapers"

if [[ $# -eq 0 ]]; then
  find "$WALLPAPER_DIR" -type l,f \( -name "*.jpg" -o -name "*.png" \) \
    | while read -r file; do
      name=$(basename "$file")
      echo -en "$name\0icon\x1f$file\n"
    done
  exit 0
fi

file=$(find "$WALLPAPER_DIR" -name "$1" | head -1)
awww img "$file" --transition-type center --transition-duration 1.5 --transition-fps 60
