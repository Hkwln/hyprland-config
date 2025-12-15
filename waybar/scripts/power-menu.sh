#!/bin/bash

# Simple power menu using rofi
option=$(echo -e "Shutdown\nReboot\nSuspend\nLock\nLogout" | rofi -dmenu -i -p "Power Menu")

case "$option" in
    Shutdown)
        systemctl poweroff
        ;;
    Reboot)
        systemctl reboot
        ;;
    Suspend)
        systemctl suspend
        ;;
    Lock)
        hyprlock || swaylock
        ;;
    Logout)
        hyprctl dispatch exit
        ;;
esac
