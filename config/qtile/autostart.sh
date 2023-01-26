#!/bin/sh

systemctl --user import-environment DISPLAY WAYLAND_DISPLAY SWAYSOCK XDG_CURRENT_DESKTOP XDG_ACTIVATION_TOKEN
dbus-update-activation-environment 2>/dev/null && dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY SWAYSOCK XDG_CURRENT_DESKTOP XDG_ACTIVATION_TOKEN
/usr/lib/xdg-desktop-portal-wlr &
/usr/lib/xdg-desktop-portal-gtk &
/usr/lib/xdg-desktop-portal &

gsettings set org.gnome.desktop.interface gtk-theme 'Catppuccin-pink'
gsettings set org.gnome.desktop.interface cursor-theme 'Catppuccin Blue'
gsettings set org.gnome.desktop.interface icon-theme 'Papirus'

if [ "$COMPUTER_IDENTIFIER" = "main-desktop" ]; then
  kanshi -c /home/stianlj/.config/kanshi/config-main-desktop &
elif [ "$COMPUTER_IDENTIFIER" = "work-laptop" ]; then
  kanshi -c /home/stianlj/.config/kanshi/config &
fi

swaybg -m fill -i "$WALLPAPER" &

eww daemon
if [ "$COMPUTER_IDENTIFIER" = "main-desktop" ]; then
  eww open "bar-ultrawide"
elif [ "$COMPUTER_IDENTIFIER" = "work-laptop" ]; then
  if [ "$NO_OF_OUTPUTS" -gt "1" ] && [ "$NO_OF_OUTPUTS" -lt "3"]; then
    eww open "bar-dual-ultrawide"
  elif [ "$NO_OF_OUTPUTS" -gt "2" ]; then
    eww open "bar-triple"
  else
    eww open bar
  fi
fi

# wl-paste -pw wl-copy &
# wl-paste -p -t text --watch clipman store -P --histpath=\"~/.local/share/clipman-primary.json\" &
nextcloud --logfile /tmp/nextcloud.log --background &
emacs &
