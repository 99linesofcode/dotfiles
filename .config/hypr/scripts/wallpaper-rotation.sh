#!/bin/bash

export SWWW_TRANSITION_FPS=60
export SWWW_TRANSITION_STEP=2

INTERVAL="15m"
WALLPAPER_DIRECTORY="$HOME/Pictures/Wallpapers/The Mandolorian/"

while true; do
	find "$WALLPAPER_DIRECTORY" | shuf -n 1 | sed 's/ /\\ /g' | xargs swww img && sleep $INTERVAL
done
