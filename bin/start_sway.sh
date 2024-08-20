#!/usr/bin/env sh

export MOZ_ENABLE_WAYLAND=1
export XDG_SESSION_TYPE=wayland
export XDG_CURRENT_DESKTOP=sway
export XDG_SESSION_DESKTOP=sway
export GTK_USE_PORTAL=0
export GDK_BACKEND=wayland
export QT_QPA_PLATFORM=wayland
export QUTE_QT_WRAPPER=PyQt6
export QT_SCALE_FACTOR_ROUNDING_POLICY=RoundPreferFloor
export XKB_DEFAULT_OPTIONS=compose:ralt
export _JAVA_AWT_WM_NONREPARENTING=1
export XCURSOR_SIZE=24

exec sway "$@"
