#      _               _                           __ _ _      
#     | |__   __ _ ___| |__       _ __  _ __ ___  / _(_) | ___ 
#     | '_ \ / _` / __| '_ \     | '_ \| '__/ _ \| |_| | |/ _ \
#    _| |_) | (_| \__ \ | | |    | |_) | | | (_) |  _| | |  __/
#   (_)_.__/ \__,_|___/_| |_|____| .__/|_|  \___/|_| |_|_|\___|
#                          |_____|_|                           

source ~/.config/shell/commonprofile

[ -f ~/.bashrc ] && source ~/.bashrc

# auto start x server
if [ -z $DISPLAY ] && [ $(tty) = /dev/tty1 ]; then
    startx
fi
