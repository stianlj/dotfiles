local wezterm = require 'wezterm';
return {
  font = wezterm.font("JetBrainsMonoMedium Nerd Font Mono"),
  default_prog = {"/usr/bin/fish", "-l"},
  font_size = 13.0,
  harfbuzz_features = {"zero"},
  window_background_opacity = 0.9,
}
