local wezterm = require("wezterm")
-- TODO: https://github.com/prabirshrestha/dotfiles/blob/main/.config/wezterm/wezterm.lua
return {
  font = wezterm.font("MonoLisa"),
  default_prog = { "/usr/bin/fish", "-l" },
  font_size = 12.0,
  use_fancy_tab_bar = false,
  tab_bar_at_bottom = true,
  window_background_opacity = 0.9,
  hide_tab_bar_if_only_one_tab = true,
  color_scheme = "Catppuccin Macchiato",
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },
  keys = {
    { key = "c", mods = "ALT", action = wezterm.action.CopyTo("ClipboardAndPrimarySelection") },
    { key = "v", mods = "ALT", action = wezterm.action.PasteFrom("Clipboard") },
    { key = "v", mods = "ALT", action = wezterm.action.PasteFrom("PrimarySelection") },
  },
}
