#!/bin/bash

CHOICE=$(wofi --show dmenu --style ~/.config/wofi/style.css --prompt "Power" <<EOF
Logout
Reboot
Shutdown
EOF
)

case "$CHOICE" in
  Logout)
    hyprctl dispatch exit
    ;;
  Reboot)
    systemctl reboot
    ;;
  Shutdown)
    systemctl poweroff
    ;;
esac

