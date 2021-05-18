#             _
#     _______| |__  _ __ ___
#    |_  / __| '_ \| '__/ __|
#   _ / /\__ \ | | | | | (__
#  (_)___|___/_| |_|_|  \___|
#

autoload -U colors && colors

PS1=" %B%{$fg[yellow]%}Z_%{$fg[white]%} %1~ %{$fg[yellow]%}>>>%{$reset_color%}%b "

## tab completion grid
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

## Enable history
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.config/zsh/.zsh_history

## Vi mode
bindkey -v
export KEYTIMEOUT=1

source ~/.config/shell/commonrc

ufetch-arch

# Syntax highlight
# source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
