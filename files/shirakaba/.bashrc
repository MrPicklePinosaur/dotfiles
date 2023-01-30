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
bind '"\C-f":"fcd\n"'
bind '"\C-l":"clear\n"'

# history
HISTCONTROL=ignoredups:erasedups
shopt -s histappend
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

# prompt
export CODENAME=白樺
PS1='\[\033[01;33m\] ${CODENAME}・\[\033[01;37m\]\W\[\033[01;33m\] > \[\033[00m\]'

[ -f ~/.config/shell/commonrc ] && source ~/.config/shell/commonrc
[ -f ~/.config/shell/commonalias ] && source ~/.config/shell/commonalias

# other configuration

export EDITOR="vim.gtk3"

export PATH="${HOME}/.local/bin:${HOME}/Scripts:$PATH"

## ruby
export GEM_HOME=$HOME/.cache/gem
[ -f "/home/pinosaur/.ghcup/env" ] && source "/home/pinosaur/.ghcup/env" # ghcup-env

## vxworks
export WR_ROOT="$HOME/Installs/wrsdk-vxworks7-qemu"
export WR_SHARED="$HOME/.cache/vxworks/opt"
. "$HOME/.cargo/env"

vxworks_env() {
    source $WR_ROOT/sdkenv.sh
    PS1="(vxworks) $PS1"
}

## golang
[[ -s "/home/pinosaur/.gvm/scripts/gvm" ]] && source "/home/pinosaur/.gvm/scripts/gvm"

## nodejs
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

