#!/bin/sh

get_option() {
    xrdb -query | grep $1 | awk '{print $2}'
}

config_file=$XDG_CONFIG_HOME/zathura/zathurarc

cat > $config_file <<- CONF
set recolor
set recolor-darkcolor "$(get_option foreground)"
set recolor-lightcolor "$(get_option *.color0:)"
set default-bg "$(get_option *.color0:)"
map i recolor

set font Source Code Pro:size=12 
set statusbar-fg "$(get_option *.color0:)"
set statusbar-bg "$(get_option *.color2:)"
set statusbar-v-padding 2
set statusbar-h-padding 8

CONF
