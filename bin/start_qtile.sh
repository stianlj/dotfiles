#!/bin/sh

export MOZ_ENABLE_WAYLAND=1
export XDG_SESSION_TYPE=wayland
export XDG_CURRENT_DESKTOP=qtile
export GTK_USE_PORTAL=0
export GDK_BACKEND=wayland
export QT_QPA_PLATFORM=wayland
export XKB_DEFAULT_OPTIONS=compose:ralt

timestamp=$(date +%F-%R)
exec qtile start -b wayland >/tmp/qtile-"$timestamp".log 2>&1
