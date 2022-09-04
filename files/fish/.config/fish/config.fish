if status is-interactive
    # Commands to run in interactive sessions can go here
end

fish_vi_key_bindings

function fish_greeting
    ufetch-arch
end

function fish_prompt
    set_color yellow --bold
    printf "%s・" "$CODENAME"
    set_color white
    printf "%s " "$PWD"
    set_color yellow --bold
    printf "%s " "><>"
end

abbr v "vim"
abbr V "nvim"
abbr l "ls"
abbr c "cd"

for color in (set | grep -Eo '^fish_color_[a-zA-Z0-9_]+')
    set $color normal
end

set fish_color_command yellow
set fish_color_error red
set fish_color_param blue
set fish_color_autosuggestion blue
