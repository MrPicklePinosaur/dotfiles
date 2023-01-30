case $- in
    *i*) ;;
      *) return;;
esac

shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

PS1=' \[\033[01;32m\]白樺\[\033[00m\] \[\033[01;34m\]\w\[\033[00m\] > '

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

set -o vi

alias c="cd"
alias l="ls"
alias la="ls -a"
alias v="vim.gtk3"
alias V="nvim"
alias e="emacs -nw"
alias g="git"
alias d="docker"
alias dc="docker-compose"
alias t="task"
alias gr="grep -ir"

export GEM_HOME=$HOME/.cache/gem
[ -f "/home/pinosaur/.ghcup/env" ] && source "/home/pinosaur/.ghcup/env" # ghcup-env

export PATH="${HOME}/.local/bin:${HOME}/Scripts:$PATH"

export WR_ROOT="$HOME/Installs/wrsdk-vxworks7-qemu"
export WR_SHARED="$HOME/.cache/vxworks/opt"
. "$HOME/.cargo/env"

export EDITOR="vim.gtk3"

vxworks_env() {
    source $WR_ROOT/sdkenv.sh
    PS1="(vxworks) $PS1"
}

[[ -s "/home/pinosaur/.gvm/scripts/gvm" ]] && source "/home/pinosaur/.gvm/scripts/gvm"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# history
HISTCONTROL=ignoredups:erasedups
shopt -s histappend
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

source ~/Scripts/fzfutil
