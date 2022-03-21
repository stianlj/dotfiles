#!/bin/sh

systemctl --user import-environment DISPLAY WAYLAND_DISPLAY SWAYSOCK XDG_CURRENT_DESKTOP
dbus-update-activation-environment 2>/dev/null && dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY SWAYSOCK XDG_CURRENT_DESKTOP
/usr/lib/xdg-desktop-portal-wlr &
/usr/lib/xdg-desktop-portal-gtk &
/usr/lib/xdg-desktop-portal &

gsettings set org.gnome.desktop.interface gtk-theme 'Catppuccin-pink'
gsettings set org.gnome.desktop.interface cursor-theme 'Catppuccin Blue'
gsettings set org.gnome.desktop.interface icon-theme 'Papirus'

kanshi -c /home/stianlj/.config/kanshi/config-main-desktop &
swaybg -m fill -i "$WALLPAPER" &

wl-paste -pw wl-copy &
wl-paste -p -t text --watch clipman store -P --histpath=\"~/.local/share/clipman-primary.json\" &
sleep 1
nextcloud --logfile /tmp/nextcloud.log --background &
