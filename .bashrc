#      _               _              
#     | |__   __ _ ___| |__  _ __ ___ 
#     | '_ \ / _` / __| '_ \| '__/ __|
#    _| |_) | (_| \__ \ | | | | | (__ 
#   (_)_.__/ \__,_|___/_| |_|_|  \___|
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# prompt lmao
PS1=' λ_ \W > '

#set vi mode
set -o vi

# ibus
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
#ibus-daemon -drx

# Enivormentals
export PATH=$HOME/Scripts:$HOME/Scripts/dmenu:$HOME/Scripts/statusbar:$HOME/Scripts/acpi:$PATH
export NINEIT_USERNAME=pinosaur

export XDG_CONFIG_HOME=$HOME/.config
export EDITOR="vim"
export READER="zathura"
export TERMINAL="st"
export BROWSER="brave"
export WM="dwm"

# aliaseseses
alias ls='ls --color=auto'
# alias git-pushall='git-pushall ' # for alias chaining
alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
alias suckless-clean='make clean && rm -rf config.h && git reset --hard home/master'
alias musicdl="youtube-dl -f bestaudio"
alias mpv="mpv --no-input-default-bindings"
# alias lockscreen='slock -m "$(figlet locked xd | cowsay -f cheese -n)"'
alias darkmpv='mpv --vf=sub,lavfi="negate"'
alias nmaplocal='nmap -sn 192.168.1.0/24'

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
