#!/bin/sh

MONITOR_STATE=$(hyprctl monitors all | awk '/Monitor/ { print $2 }')

set -- $MONITOR_STATE

if [ $# -eq "1" ]; then
	exit
fi

STATE=$(awk -F '=' '/DISPLAY_STATE=/ {print $2}' ~/dotfiles/.config/hypr/scripts/settings.conf)
FILEPATH="$HOME/dotfiles/.config/hypr/scripts/settings.conf"

case $STATE in
Primary)
	sed -i 's/DISPLAY_STATE=Primary/DISPLAY_STATE=Secondary/' $FILEPATH
	hyprctl keyword monitor "$1,highres,0x0,2"
	hyprctl keyword monitor "$2,disable"
	notify-send -i video-display "Laptop screen only"
	;;
Secondary)
	sed -i 's/DISPLAY_STATE=Secondary/DISPLAY_STATE=Extend/' $FILEPATH
	hyprctl keyword monitor "$2,preferred,auto,2"
	hyprctl keyword monitor "$1,disable"
	notify-send -i video-display "Second screen only"
	;;
Extend)
	sed -i 's/DISPLAY_STATE=Extend/DISPLAY_STATE=Primary/' $FILEPATH
	hyprctl keyword monitor "$1,highres,0x0,2"
	notify-send -i video-display "Extend screens"
	;;
esac
