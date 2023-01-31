local wezterm = require("wezterm")
local action = wezterm.action

-- TODO: https://github.com/prabirshrestha/dotfiles/blob/main/.config/wezterm/wezterm.lua
return {
  font = wezterm.font({
    -- INFO: Read https://wezfurlong.org/wezterm/config/font-shaping.html for more advanced font shaping
    -- And https://www.monolisa.dev/faq#how-to-enable-stylistic-sets-for-the-kitty-terminal
    family = "MonoLisa",
    harfbuzz_features = { "ss02=1" },
  }),
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
    { key = "c", mods = "ALT", action = action.CopyTo("ClipboardAndPrimarySelection") },
    { key = "v", mods = "ALT", action = action.PasteFrom("Clipboard") },
    { key = "v", mods = "ALT", action = action.PasteFrom("PrimarySelection") },
    { key = "t", mods = "SHIFT|ALT", action = action.SpawnTab("CurrentPaneDomain") },
    { key = "1", mods = "SHIFT|ALT", action = action.ActivateTab(0) },
    { key = "2", mods = "SHIFT|ALT", action = action.ActivateTab(1) },
    { key = "3", mods = "SHIFT|ALT", action = action.ActivateTab(2) },
    { key = "4", mods = "SHIFT|ALT", action = action.ActivateTab(3) },
    { key = "5", mods = "SHIFT|ALT", action = action.ActivateTab(4) },
    { key = "6", mods = "SHIFT|ALT", action = action.ActivateTab(5) },
    { key = "7", mods = "SHIFT|ALT", action = action.ActivateTab(6) },
    { key = "8", mods = "SHIFT|ALT", action = action.ActivateTab(7) },
    { key = "9", mods = "SHIFT|ALT", action = action.ActivateTab(8) },
  },
}
