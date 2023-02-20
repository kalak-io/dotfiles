#!/bin/bash

# This script get the Astronomy Picture of the Day from NASA and display it like wallpaper.
# Tested with Arch/i3

# Retrieve NASA_API_KEY
source $HOME/Documents/projects/personal/dotfiles/.env
# Set output destination
WALLPAPER_PATH=$HOME/.wallpaper.jpg

# Get HD day picture
APOD=$(curl --location --request GET https://api.nasa.gov/planetary/apod\?api_key\=${NASA_API_KEY})
HD_CURL=$(echo $APOD | jq -r '.hdurl')
URL=$(echo $APOD | jq -r '.url')
if [[ -n HD_CURL ]]
then
    curl $HD_CURL --output $WALLPAPER_PATH
else
    curl $URL --output $WALLPAPER_PATH
fi

# # Set wallpaper
feh --bg-fill $WALLPAPER_PATH
