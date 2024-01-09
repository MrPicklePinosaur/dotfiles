#      _               _              
#     | |__   __ _ ___| |__  _ __ ___ 
#     | '_ \ / _` / __| '_ \| '__/ __|
#    _| |_) | (_| \__ \ | | | | | (__ 
#   (_)_.__/ \__,_|___/_| |_|_|  \___|
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[ -f ~/.bash_profile ] && source ~/.bash_profile

# shell options
set -o vi

shopt -s cdable_vars
shopt -s cdspell
shopt -s extglob
shopt -s autocd
shopt -s no_empty_cmd_completion
shopt -s checkwinsize
set -o noclobber

# keybinds
bind '"\C-f":"fcd .\n"'
bind '"\C-l":"clear\n"'

# history
HISTCONTROL=ignoredups:erasedups
shopt -s histappend
# PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

# prompt
PS1='\[\033[01;36m\] ${CODENAME}・\[\033[01;37m\]\W\[\033[01;36m\] > \[\033[00m\]'

# PROGRAM CONFIGURATION
export PATH="$HOME/.local/bin:$HOME/Scripts:$PATH"

## vxworks
export WR_ROOT="$HOME/Installs/wrsdk-vxworks7-custom"
export WR_SHARED="$HOME/.cache/vxworks/opt"

vxworks_env() {
    source $WR_ROOT/sdkenv.sh
    PS1="(vxworks) $PS1"
}

## cargo
. "$HOME/.cargo/env"

## ansible
export ANSIBLE_NOCOWS=1

## emgo
export EGCC=/usr/bin/arm-none-eabi-gcc
export EGLD=/usr/bin/arm-none-eabi-ld
export EGAR=/usr/bin/arm-none-eabi-ar
export EGROOT=$HOME/Installs/emgo/egroot
export EGPATH=$HOME/Installs/emgo/egpath

## fzf

FUZZY_DIRS="$HOME/School $HOME/Downloads $HOME/Repos"

# fuzzy history search
[ -f ~/Scripts/fzf_history ] && source ~/Scripts/fzf_history

[ -f ~/.config/shell/commonrc ] && source ~/.config/shell/commonrc
[ -f ~/.config/shell/commonalias ] && source ~/.config/shell/commonalias

[ -f ~/.secrets ] && source ~/.secrets

# temp add nvim to path
export PATH="$HOME/Installs/nvim-linux64/bin:$PATH"

export PATH="$PATH:/home/pinosaur/.config/.foundry/bin"

export PATH="$PATH:/home/pinosaur/.surrealdb"

alias fd=fdfind
[ -f ~/Scripts/apt-alias ] && source ~/Scripts/apt-alias

# github access token for ghcr auth
export CR_PAT=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

# adb
if [ -d "$HOME/Installs/platform-tools" ] ; then
     export PATH="$HOME/Installs/platform-tools:$PATH"
fi

# cs452 arm cross compiler
export PATH="$PATH:/home/pinosaur/Installs/arm-gnu-toolchain-12.3.rel1-x86_64-aarch64-none-elf/bin"

# cs343
export PATH="$PATH:/home/pinosaur/Installs/uCPP/u++-7.0.0/bin"

# zig
export PATH="$PATH:/home/pinosaur/Installs/zig-linux-x86_64-0.11.0"

# i dont care about gs
alias gs="echo 'you typed \`gs\` instead of \`g s\` you goof'"

[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

# ufetch-popos

# exec nu
# clear
pinosh

# auto start zellij
# export ZELLIJ_AUTO_EXIT="false"
# if [[ -z "$ZELLIJ" ]]; then
#     if [[ "$ZELLIJ_AUTO_ATTACH" == "true" ]]; then
#         zellij attach -c
#     else
#         zellij
#     fi
# 
#     if [[ "$ZELLIJ_AUTO_EXIT" == "true" ]]; then
#         exit
#     fi
# fi
