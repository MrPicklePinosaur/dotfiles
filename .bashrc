#      _               _              
#     | |__   __ _ ___| |__  _ __ ___ 
#     | '_ \ / _` / __| '_ \| '__/ __|
#    _| |_) | (_| \__ \ | | | | | (__ 
#   (_)_.__/ \__,_|___/_| |_|_|  \___|
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# prompt lmao
PS1='\[\033[01;33m\] λ_\[\033[01;37m\] \W\[\033[01;33m\] > \[\033[00m\]'
PS2='\[\033[01;37m\]> \[\033[00m\]'

#set vi mode
set -o vi

# ibus
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
#ibus-daemon -drx

# Enivormentals
export PATH=$HOME/.local/bin:$HOME/Scripts:$HOME/Scripts/dmenu:$HOME/Scripts/statusbar:$HOME/Scripts/acpi:$PATH
export NINEIT_USERNAME=pinosaur

export XDG_CONFIG_HOME=$HOME/.config
export EDITOR="vim"
export READER="zathura"
export TERMINAL="st"
export BROWSER="brave"
export WM="dwm"

# aliaseseses
alias ls='ls --color=auto'
alias grep='grep--color=auto'
alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
alias suckless-clean='make clean && rm -rf config.h && git reset --hard home/master'
alias musicdl="youtube-dl -f bestaudio"
alias mpv="mpv --no-input-default-bindings"
alias darkmpv='mpv --vf=sub,lavfi="negate"'
alias nmaplocal='nmap -sn 192.168.1.0/24'
alias refreshusb='udevadm control --reload-rules'
alias vpnup='nmcli connection up pinovpn'
alias drill-srs='drill-srs 2>/dev/null'

alias v="$EDITOR"
alias z="$READER"
alias b="$BROWSER"

# connect to wifi
# nmcli device wifi connect WIFI_NAME password PASSWORD
# record
# ffmpeg -y -f x11grab -s 1600x900 -i :0.0 -f alsa -i default -c:v libx264 -r 30 -c:a flac $filename


source fzfutil

# startup stuff
ufetch-arch

export LF_ICONS="\
di=:\
fi=:\
ln=:\
or=:\
ex=:\
*.c=:\
*.cc=:\
*.cpp=:\
*.go=:\
*.hs=:\
*.java=:\
*.html=:\
*.css=:\
*.js=:\
*.ts=:\
*.json=:\
*.jsx=:\
*.tsx=:\
*.vue=﵂:\
*.php=:\
*.py=:\
*.rkt=λ:\
*.tex=:\
*.md=:\
*.vim=:\
*.vimrc=:\
*.viminfo=:\
*.gitignore=:\
*.cmd=:\
*.sh=:\
*.bash=:\
*.zsh=:\
*.fish=:\
*.diff=繁:\
*.bashrc=
*.tar=:\
*.zip=:\
*.jar=:\ 
*.rar=:\
*.7z=:\
*.gz=:\
*.zst=:\
*.jpg=:\
*.jpeg=:\
*.gif=:\
*.bmp=:\
*.png=:\
*.svg=:\
*.mov=:\
*.webm=:\
*.mp4=:\
*.mid=:\
*.midi=:\
*.mp3=:\
*.ogg=:\
*.wav=:\
*.pdf=:\
"
