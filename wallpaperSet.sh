#!/bin/bash

argument=$1

DIR="/home/zane/Pictures/wallpapers/"

randNum() {
    return $(( 1 + ($RANDOM % $1) ))
}

# randFile()
# param:    String name for the wallpaper catagory we want
# return:   A randomly indexed file from catagory 
randFile() {

    file_type=$@
    
    # Getting files
    files=$(ls $DIR | grep $file_type -i)

    # Getting file count with 'file_type' in title
    num=$(echo "$files" | wc -l)

    randNum $num

    index=$? 

    echo $(echo $files | cut -d ' ' -f $index)
}

# Functions that gets a random file of their catagory
woman() {
    randFile 'woman'
    echo $@
}

scifi() {
    randFile 'scifi'
    echo $@
}

samuri() {
    randFile 'samuri'
    echo $@
}

company() {
    randFile 'company'
    echo $@
}

any() {
    randFile '.'
    echo $@
}

# Choose if argument passed
# Currently only 'woman' and 'default' is the only argument recognized
byArgument() {
    if [[ $1 = 'woman' ]]
    then
        echo $(woman)
    elif [[ $1 = 'default' ]]
    then
        echo "WomanByRiver.painting.jpg"
    elif [[ $1 = 'samuri' ]]
    then
        echo "Samurai.jpg"
    else
        echo $(any)
    fi
}

# Choose by date
byDate() {
    # Main contole flow structure
    if [[ $day = 'Sat' ]] || [[ $day = 'Sun' ]]
    then
        samuri
    elif [[ $day = 'Mon' ]]
    then
        any
    else
        woman
    fi

    echo $@
}

main() {

    day=$(date | cut -d ' ' -f 1)

    wallpaper="WomanByRiver.painting.jpg"

    if [[ $argument = '' ]]
    then
        wallpaper=$(byDate)
    elif [[ $argument = 0 ]]
    then
        # set empty wallpaper
        read
    else
        wallpaper=$(byArgument $argument)
    fi

    xwallpaper --maximize "$DIR$wallpaper"
}

main
