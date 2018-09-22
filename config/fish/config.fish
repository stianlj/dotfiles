# fish_vi_key_bindings
set fish_greeting ""

set -gx TERM xterm-256color
set -gx LIBVIRT_DEFAULT_URI qemu:///system
set -gx EDITOR nvim

bind yy fish_clipboard_copy
bind p fish_clipboard_paste
