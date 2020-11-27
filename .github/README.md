# Dotfiles!!

## How I manage dotfiles
This method of managing dotfiles was inspired by [this](https://www.youtube.com/watch?v=tBoLDpTWVOM) video.

TLDR;
Run in your home directory:
```
git init --bare .dotfiles
```

Then for ease of use add this alias to your bashrc (etc):
```
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
```

After reloading the shell, run:
```
dotfiles config --local status.showUntrackedFiles no
```

Now you can use the normal git commands like so
```
dotfiles add .bashrc
dotfiles status
dotfiles commit -m 'added .bashrc'
```

## Features

