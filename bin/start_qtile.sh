#!/bin/sh

export MOZ_ENABLE_WAYLAND=1
export XDG_SESSION_TYPE=wayland
export XDG_CURRENT_DESKTOP=qtile
export GTK_USE_PORTAL=0
export GDK_BACKEND=wayland
export QT_QPA_PLATFORM=wayland
export XKB_DEFAULT_OPTIONS=compose:ralt
# TODO: Make a function to find out which card is used. Sometimes card0 and sometimes card1
if [ -f "/sys/class/drm/card1-*/status" ]; then
  export NO_OF_OUTPUTS=$(cat /sys/class/drm/card1-*/status | grep -w "connected" | wc -l)
else
  export NO_OF_OUTPUTS=$(cat /sys/class/drm/card0-*/status | grep -w "connected" | wc -l)
fi
timestamp=$(date +%F-%R)
exec qtile start -b wayland >/tmp/qtile-"$timestamp".log 2>&1
