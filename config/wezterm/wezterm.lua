local wezterm = require("wezterm")
-- TODO: https://github.com/prabirshrestha/dotfiles/blob/main/.config/wezterm/wezterm.lua
return {
  font = wezterm.font("MonoLisa"),
  default_prog = { "/usr/bin/fish", "-l" },
  font_size = 12.0,
  window_background_opacity = 0.9,
  hide_tab_bar_if_only_one_tab = true,
  color_scheme = "Catppuccin Macchiato",
}
