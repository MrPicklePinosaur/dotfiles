#!/bin/sh

#           _       _ _
#     __  _(_)_ __ (_) |_ _ __ ___
#     \ \/ / | '_ \| | __| '__/ __|
#    _ >  <| | | | | | |_| | | (__
#   (_)_/\_\_|_| |_|_|\__|_|  \___|
#
 
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap
userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap

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
feh --bg-scale "$(ls -d $HOME/Downloads/wallpapers/active/* | sort -R | tail -n1)"

# ibus
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
ibus-daemon -drx

# start some daemons
dwmblocks &
tiramisu -j | notify &
acpi_listen &
redshift -l 55.7:12.6 -t 3000:3000 -g 0.85 -m randr -v &
sxhkd &
mpd &
mpd-change &
xbanish &
picom &
#syncthing &

exec dwm
# while true; do
#     /usr/local/bin/dwm 2> /dev/null
# done

