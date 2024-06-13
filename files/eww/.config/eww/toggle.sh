#!/bin/sh

# toggle bar and widget on or off
if [ "$(eww active-windows | grep -v '^$' | wc -l)" -eq 0 ]; then
    eww open bar
else
    eww close-all
fi
