# Dotfiles!!

## Scripts

Here are some notable Scripts

### emoter
Paste emote sized images automatically when dmenu (~~great for if you don't have nitro~~).

### fzfutil
cd-ing and vi-ing at the speed of light. Uses fzf to let you cd to dirs and edit files across the galaxy.
Simply source the script in your .bashrc or equivalent. 
Customize which directories you want to include by editing the script.

### git-pushall
Useful for when you have a repo with multiple remotes and are too lazy to push to them all.
Usage is as follows:
```
git-pushall [branch]
```
Limitations: does not work on bare repos yet

### mpd-change
Sends a notification whenever mpd changes songs. Does not send anything on pause/play.

### screenshot
Take screenshots with scrot. Dmenu prompt for filename, leaving empty generates a default name.
Limitations: no way to cancel screenshot, also the name prompt happens before the screenshot is taken (which is sorta annoying).
Will improve later.

### usbmnt
Sends a notification whenever usb is mounted.

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

