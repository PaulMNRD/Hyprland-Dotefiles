#!/usr/bin/env bash

if [[ $# -eq 0 ]]; then
  echo -en "Bluetooth Settings\0icon\x1fbluetooth\n"
  echo -en "Color Picker\0icon\x1fcolor-picker\n"
  echo -en "Network Settings\0icon\x1fnetwork-wireless\n"
  echo -en "Power Menu\0icon\x1fsystem-shutdown\n"
  echo -en "System Monitor\0icon\x1fsystem-monitor\n"
  exit 0
fi

pkill rofi
sleep 0.5

case "$1" in
  "Bluetooth Settings") kitty --title "Bluetooth Settings" bluetui ;;
  "Color Picker") hyprpicker -a ;;
  "Network Settings") kitty --title "Network Settings" impala ;;
  "Power Menu") wlogout --buttons-per-row 5 ;;
  "System Monitor" ) kitty --title "System Monitor" btop;;
esac
