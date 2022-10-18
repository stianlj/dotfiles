#!/bin/sh

cd ~

export MOZ_ENABLE_WAYLAND=1
export XDG_SESSION_TYPE=wayland
export XDG_CURRENT_DESKTOP=hyprland
export GTK_USE_PORTAL=0
export GDK_BACKEND=wayland
export QT_QPA_PLATFORM=wayland
export XKB_DEFAULT_OPTIONS=compose:ralt
export _JAVA_AWT_WM_NONREPARENTING=1
export XCURSOR_SIZE=24

exec Hyprland
