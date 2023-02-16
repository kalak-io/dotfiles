#!/bin/bash

# This script get the Astronomy Picture of the Day from NASA and display it like wallpaper.
# Tested with Arch/i3

# Retrieve NASA_API_KEY
source ../../.env

# Set output destination
WALLPAPER_PATH=$HOME/.wallpaper.jpg

# Get HD day picture
HD_CURL=$(curl --location --request GET https://api.nasa.gov/planetary/apod\?api_key\=${NASA_API_KEY}  | jq -r '.hdurl')
curl $HD_CURL --output $WALLPAPER_PATH

# Set wallpaper
feh --bg-fill $WALLPAPER_PATH
