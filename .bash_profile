
source ~/.config/shell/commonprofile

[ -f ~/.bashrc ] && source ~/.bashrc

# auto start x server
if [ -z $DISPLAY ] && [ $(tty) = /dev/tty1 ]; then
    startx
fi
