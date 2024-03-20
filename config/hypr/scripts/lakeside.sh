#!/bin/bash

ASSETS_DIR="/home/kalak/.config/hypr/assets/lakeside"

# This controls (in seconds) when to switch to the next image
INTERVAL=600

current_hour=$(date +"%H:%M")
echo $current_hour

#for img in "$ASSETS_DIR"/*; do
#  echo $img
#  filename="${img##*/}"
#  echo $filename
#done
