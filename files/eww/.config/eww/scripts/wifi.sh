#!/bin/sh

interface=wlp1s0

ssid() {
    echo $(nmcli c | grep $interface | awk '{print ($1)}')
}

stat() {
    echo $(nmcli g | awk 'NR==2 {print $1}')
}

strength() {
    echo $(nmcli -f IN-USE,SIGNAL,SSID device wifi | awk '/^\*/{if (NR!=1) {print $2}}')
}

icon() {
    # TODO pretty ugly to do switch in yuck so will implement it here
    status=$(stat)
    icon="?"
    case $status in
        "connected")
            strength=$(strength)
            if [ "$strength" -gt 90 ]; then
                icon="󰤨"
            elif [ "$strength" -gt 80 ]; then
                icon="󰤥"
            elif [ "$strength" -gt 70 ]; then
                icon="󰤢"
            elif [ "$strength" -gt 60 ]; then
                icon="󰤟"
            else
                icon="󰤯"
            fi
            ;;
        "disconnected")
            icon="󰤫"
            ;;
        *)
            ;;
    esac
    echo $icon
}

case "$1" in
    "ssid") ssid;;
    "stat") stat;;
    "icon") icon;;
    *);;
esac
