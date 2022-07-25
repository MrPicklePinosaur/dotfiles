# dotfiles

## USAGE

my dotfiles are managed using [GNU stow](https://www.gnu.org/software/stow/).
the goal of this dotfile repo are to:
- version all of my important configuration files
- easily bootstrap and download files on new machines
- update configuration files on all devices when i make a change
- support differences in configs on different machines

## CONTENTS

dotfiles modules that are included:
- apps: configuration files for common media apps (mpv, mutt, newsboat,  zathura)
- bash
- common-scripts: utility scripts
- desktop-scripts: utility scripts that are for desktop use (ie screenshot, emoter, monitor attach)
- git
- misc: some loose config files that are have not been organized yet
- music: mpd and ncmpcpp
- nvim: depends on vim module
- statusbar: statusbar scripts
- qutebrowser
- tmux
- vim: vimrc and contents of `.vim`
- xmonad
- xorg: config for x11 (xinit, Xresource etc)
- zsh: depends on bash module

## PROFILES

profiles are predefined sets of modules 

## SCRIPTS

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

