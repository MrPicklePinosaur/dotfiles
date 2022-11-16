#!/bin/sh

#           _       _ _
#     __  _(_)_ __ (_) |_ _ __ ___
#     \ \/ / | '_ \| | __| '__/ __|
#    _ >  <| | | | | | |_| | | (__
#   (_)_/\_\_|_| |_|_|\__|_|  \___|
#
 
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap
userresources=$HOME/.config/xorg/Xresources
usermodmap=$HOME/.config/xorg/Xmodmap

# merge in defaults and keymaps
[ -f "$sysresources" ] && xrdb -merge "$sysresources"
[ -f "$sysmodmap" ] && xmodmap "$sysmodmap"
[ -f "$userresources" ] && xrdb -merge "$userresources"
[ -f "$usermodmap" ] && xmodmap "$usermodmap"

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# bg
setwallpaper

# start some daemons
setxkbmap -option caps:escape

dwmblocks &
tiramisu -j | notify &
acpi_listen &
nightlight
sxhkd &
mpd &
mpd-change &
xbanish &
# picom --experimental-backends &
# syncthing &

# ibus
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
ibus-daemon -drx

exec dwm
