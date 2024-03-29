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

# keybinds
bind '"\C-f":"lfcd\n"'
bind '"\C-l":"clear\n"'
# bind "TAB:menu-complete"

# prompt lmao
PS1='\[\033[01;32m\] ${CODENAME}・\[\033[01;37m\]\W\[\033[01;32m\] > \[\033[00m\]'
PS2='\[\033[01;37m\]> \[\033[00m\]'

#source ~/.config/shell/commonrc

alias v="vim"
alias V="nvim"
alias g="git"
alias l="ls"
alias la="ls -a"
alias c="cd"

# startup stuff
#ufetch-void
