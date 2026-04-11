# dotfiles

My personal configuration files for Linux desktop and development environment.

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
