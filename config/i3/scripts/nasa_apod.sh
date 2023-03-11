#!/bin/bash

# This script get the Astronomy Picture of the Day from NASA and display it like wallpaper.
# Tested with Arch/i3

# Retrieve NASA_API_KEY
source $HOME/Documents/projects/personal/dotfiles/.env

# Set output destination
DEFAULT_EXTENSION=jpg
WALLPAPER_PATH=$HOME/.wallpaper.$DEFAULT_EXTENSION

function fetchWallpaper {
    APOD=$(curl --location --request GET https://api.nasa.gov/planetary/apod\?api_key\=${NASA_API_KEY})
    HD_CURL=$(echo $APOD | jq -r '.hdurl')
    if [[ -n HD_CURL ]]
    then
        # Get HD day picture
        curl $HD_CURL --output $WALLPAPER_PATH
    else
        # fallback
        URL=$(echo $APOD | jq -r '.url')
        curl $URL --output $WALLPAPER_PATH
    fi
    return $WALLPAPER_PATH
}

function setWallpaper {
    # Set wallpaper
    feh --bg-fill ${1:-WALLPAPER_PATH}
}

function saveWallpaper {
    BACKUP_PATH=$HOME/Pictures/NASA
    PREFIX=NASA_APOD_
    CURRENT_DATE=$(date +'%Y-%m-%d')
    mkdir -p $BACKUP_PATH
    cp $WALLPAPER_PATH $BACKUP_PATH/$PREFIX$CURRENT_DATE.$DEFAULT_EXTENSION
}
