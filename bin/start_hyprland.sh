#!/bin/sh

cd ~

export MOZ_ENABLE_WAYLAND=1
# export MOZ_WEBRENDER=0
# export WLR_DRM_DEVICES=/dev/dri/card0:/dev/dri/card1
# export WLR_RENDER_DRM_DEVICE=/dev/dri/card0
# export LIBVA_DRIVER_NAME=nvidia
export XDG_SESSION_TYPE=wayland
export XDG_CURRENT_DESKTOP=hyprland
export GTK_USE_PORTAL=0
export GDK_BACKEND=wayland
# export GBM_BACKEND=nvidia-drm
# export __GLX_VENDOR_LIBRARY_NAME=nvidia
# export WLR_NO_HARDWARE_CURSORS=1
export QT_QPA_PLATFORM=wayland
export XKB_DEFAULT_OPTIONS=compose:ralt
export _JAVA_AWT_WM_NONREPARENTING=1
export XCURSOR_SIZE=24

exec Hyprland
