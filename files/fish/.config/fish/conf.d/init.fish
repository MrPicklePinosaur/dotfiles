set fish_greeting ""

fish_vi_key_bindings

# starship init fish | source

fzf_configure_bindings --directory=\cf

fish_add_path ~/Scripts

# set -uX MUJOCO_PATH $HOME/Installs/mujoco-3.2.0/
set -x ANDROID_HOME /opt/android-sdk
set -x PATH $PATH $ANDROID_HOME/cmdline-tools/latest/bin
set -x PATH $PATH $ANDROID_HOME/platform-tools
set -x PKG_CONFIG_PATH /usr/include/webkitgtk-4.1/

source /opt/miniconda3/etc/fish/conf.d/conda.fish
