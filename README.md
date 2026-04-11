# dotfiles

Personal configuration files for Linux desktop and development environment.

## Structure

| Path          | Description                                                       |
| ------------- | ----------------------------------------------------------------- |
| `config/`     | Per-app configs (nvim, fish, hypr, niri, waybar, tmux, etc.)      |
| `bin/`        | Executable shell scripts (sessionizer, launchers, status scripts) |
| `doom.d/`     | Doom Emacs config                                                 |
| `dir_colors/` | Custom dircolors theme                                            |
| `mutt/`       | Neomutt mail config                                               |
| `vimrc`       | Standalone Vim config                                             |

## Key Tools

- **Shell**: Fish (with Starship prompt, Atuin history)
- **Editor**: Neovim (lazy.nvim, LSP, Conform.nvim format-on-save) / Doom Emacs
- **Terminal**: Ghostty, Kitty, Wezterm
- **Window managers**: Hyprland, Niri, Sway
- **Bar**: Waybar (profile-specific configs for desktop/laptop)
- **Multiplexer**: Tmux (with sesh) / Zellij
- **File manager**: Yazi, Vifm
- **Notifications**: Mako, SwayNC

## Environment Variables

- `WALLPAPER` -- Path to wallpaper image
- `LAT_LON` -- Latitude,longitude for redshift (optional)
- `COMPUTER_IDENTIFIER` -- Machine identifier for profile switching
- `WIRED_ETHERNET_INTERFACE` -- Interface name for network stats in waybar
- `LEFT_MONITOR` / `CENTER_MONITOR` / `RIGHT_MONITOR` -- Monitor names for multi-head setups (optional)
- `CENTER_POLYBAR_BOTTOM` -- Set to put polybar at the bottom (optional)
