#!/bin/sh

BAT=`ls /sys/class/power_supply | grep BAT | head -n 1`

level() {
	cat /sys/class/power_supply/${BAT}/capacity
}

stat() {
	status=`cat /sys/class/power_supply/${BAT}/status`
    case "${status}" in
        "Discharging") echo "discharging";;
        "Charging") echo "charging";;
        "Not Charging") echo "notcharging";;
        "Full") echo "full";;
        *) echo "unknown";;
    esac
}

case "$1" in
    "level") level;;
    "stat") stat;;
    *) ;;
esac
