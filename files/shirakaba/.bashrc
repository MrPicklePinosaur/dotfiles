#      _               _              
#     | |__   __ _ ___| |__  _ __ ___ 
#     | '_ \ / _` / __| '_ \| '__/ __|
#    _| |_) | (_| \__ \ | | | | | (__ 
#   (_)_.__/ \__,_|___/_| |_|_|  \___|
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# shell options
set -o vi

shopt -s cdable_vars
shopt -s cdspell
shopt -s extglob
shopt -s no_empty_cmd_completion
shopt -s checkwinsize

# keybinds
bind '"\C-f":"fcd .\n"'
bind '"\C-l":"clear\n"'

# history
HISTCONTROL=ignoredups:erasedups
shopt -s histappend
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

# prompt
PS1='\[\033[01;36m\] ${CODENAME}・\[\033[01;37m\]\W\[\033[01;36m\] > \[\033[00m\]'

# PROGRAM CONFIGURATION
export PATH="$HOME/.local/bin:$HOME/Scripts:$PATH"

## vxworks
export WR_ROOT="$HOME/Installs/wrsdk-vxworks7-qemu"
export WR_SHARED="$HOME/.cache/vxworks/opt"
. "$HOME/.cargo/env"

vxworks_env() {
    source $WR_ROOT/sdkenv.sh
    PS1="(vxworks) $PS1"
}

[ -f ~/.config/shell/commonalias ] && source ~/.config/shell/commonalias
[ -f ~/.config/shell/commonrc ] && source ~/.config/shell/commonrc

ufetch-popos
