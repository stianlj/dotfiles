fish_vi_key_bindings 2>/dev/null
set fish_greeting ""

# set -gx TERM xterm-256color
set -gx LIBVIRT_DEFAULT_URI qemu:///system
set -gx EDITOR nvim

test -d "$HOME/.local/bin"; and set PATH "$HOME/.local/bin" $PATH

bind yy fish_clipboard_copy
bind p fish_clipboard_paste

alias ls='exa --git --extended --octal-permissions'
alias ssh='kitty +kitten ssh'

abbr --add --global vi 'nvim'
abbr --add --global cat 'bat'

thefuck --alias | source
starship init fish | source
