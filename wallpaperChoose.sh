#!/bin/bash

DIR="/home/zane/Pictures/wallpapers/"

getWallpaper() {

    files=$1

    # I have no clue why $files works and "$files" does not.
    files=$(sxiv $files -ot)

    num_files=$(echo "$files" | wc -w)

    if [[ $num_files = 1 ]]
    then
        echo "$files"
    else
        getWallpaper "$files"
    fi
}

main() {

    wallpaper=$(getWallpaper $DIR)

    # Need input verification here, need to check for
    # $wallpaper == "" or not, if not, do command
    xwallpaper --maximize $wallpaper
}

main
