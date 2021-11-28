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

abbr --add zz 'z -c'
abbr --add zi 'z -i'
abbr --add zf 'z -I'
abbr --add zb 'z -b'
abbr --add vi 'nvim'
abbr --add cat 'bat'

source ~/.local/share/nvim/site/pack/packer/start/tokyonight.nvim/extras/fish_tokyonight_night.fish
thefuck --alias | source
starship init fish | source
