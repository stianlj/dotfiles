local wezterm = require 'wezterm';
return {
  font = wezterm.font("FiraCode Nerd Font"),
  default_prog = {"/usr/bin/fish", "-l"},
  font_size = 13.0,
  harfbuzz_features = {"zero"},
  window_background_opacity = 0.9,
  hide_tab_bar_if_only_one_tab = true,
}
