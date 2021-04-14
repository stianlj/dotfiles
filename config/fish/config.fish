fish_vi_key_bindings 2>/dev/null
set fish_greeting ""

# set -gx TERM xterm-256color
set -gx LIBVIRT_DEFAULT_URI qemu:///system
set -gx EDITOR nvim

bind yy fish_clipboard_copy
bind p fish_clipboard_paste

alias ls='exa --git --extended --octal-permissions'
alias zz='z -c'
alias zi='z -i'
alias zf='z -I'
alias zb='z -b'

thefuck --alias | source

# if test "$TERM" = "eterm-color"
#     function fish_title
#     end
# end

starship init fish | source
