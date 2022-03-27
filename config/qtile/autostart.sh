#!/bin/sh

systemctl --user import-environment DISPLAY WAYLAND_DISPLAY SWAYSOCK XDG_CURRENT_DESKTOP
dbus-update-activation-environment 2>/dev/null && dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY SWAYSOCK XDG_CURRENT_DESKTOP
/usr/lib/xdg-desktop-portal-wlr &
/usr/lib/xdg-desktop-portal-gtk &
/usr/lib/xdg-desktop-portal &

gsettings set org.gnome.desktop.interface gtk-theme 'Catppuccin-pink'
gsettings set org.gnome.desktop.interface cursor-theme 'Catppuccin Blue'
gsettings set org.gnome.desktop.interface icon-theme 'Papirus'

if [ "$COMPUTER_IDENTIFIER" = "main-desktop" ]; then
  kanshi -c /home/stianlj/.config/kanshi/config-main-desktop &
  waybar -c /home/stianlj/.config/waybar/config-main-desktop &
elif [ "$COMPUTER_IDENTIFIER" = "work-laptop" ]; then
  kanshi -c /home/stianlj/.config/kanshi/config &
  # TODO: I think there is a better way to do this in waybar itself, but for now this works
  numberOfOutputsConnected=$(wlr-randr | grep "Enabled: yes" | wc -l)
  if [ "$numberOfOutputsConnected" -gt "2" ]; then
    waybar -c /home/stianlj/.config/waybar/config-work-laptop-triple &
  else
    waybar -c /home/stianlj/.config/waybar/config-work-laptop &
  fi
fi
swaybg -m fill -i "$WALLPAPER" &

wl-paste -pw wl-copy &
wl-paste -p -t text --watch clipman store -P --histpath=\"~/.local/share/clipman-primary.json\" &
sleep 1
nextcloud --logfile /tmp/nextcloud.log --background &
if [ "$COMPUTER_IDENTIFIER" = "work-laptop" ]; then
  sleep 1; /usr/bin/nm-applet --indicator &
fi
