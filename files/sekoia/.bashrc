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

PS1="\[\033[m\]|\[\033[1;35m\]\t\[\033[m\]|\[\e[1;31m\]\u\[\e[1;36m\]\[\033[m\]@\[\e[1;36m\]\h\[\033[m\]:\[\e[0m\]\[\e[1;32m\][\W]> \[\e[0m\]"

# for conda
export CRYPTOGRAPHY_OPENSSL_NO_LEGACY=1
[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh

exec fish

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

