#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

set -o vi

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

source ~/.config/shell/commonrc
source ~/.config/shell/commonalias
source ~/.secrets

. "$HOME/.cargo/env"

export QT_QPA_PLATFORM=xcb

exec fish
