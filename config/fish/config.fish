fish_vi_key_bindings 2>/dev/null
set fish_greeting ""

# set -gx TERM xterm-256color
set -gx LIBVIRT_DEFAULT_URI qemu:///system
set -gx EDITOR nvim
set -gx VOLTA_HOME $HOME/.volta

test -d "$HOME/.local/bin"; and set PATH "$HOME/.local/bin" $PATH
test -d "$HOME/.npm-global/bin"; and set PATH "$HOME/.npm-global/bin" $PATH
test -d "$HOME/.volta/bin"; and set PATH "$HOME/.volta/bin" $PATH
test -d "$VOLTA_HOME/bin"; and set PATH "$VOLTA_HOME/bin" $PATH

bind yy fish_clipboard_copy
bind p fish_clipboard_paste

alias ls='exa --git --extended --octal-permissions'
alias la='exa --git --extended --octal-permissions -la'
alias tree='et -I --dirs-first'


abbr --add --global vi 'nvim'
abbr --add --global cat 'bat'

starship init fish | source
zoxide init fish | source
direnv hook fish | source

source /home/stianlj/packages/google-cloud-sdk/path.fish.inc
