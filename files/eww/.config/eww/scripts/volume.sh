#!/bin/sh

volume() {
    pulsemixer --get-volume | awk '{print $1}'
}


# get sound icon based on the volume level
icon() {
    vol=volume
    icon="?"
    if [ "$vol" -gt 80 ]; then
        icon="󰤨"
    elif [ "$vol" -gt 80 ]; then
        icon="󰤥"
    elif [ "$vol" -gt 70 ]; then
        icon="󰤢"
    elif [ "$vol" -gt 60 ]; then
        icon="󰤟"
    else
        icon="󰤯"
    endif
}

case "$1" in
    "volume") volume;;
    "icon") icon;;
    *) ;;
esac
