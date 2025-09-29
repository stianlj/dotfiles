import os

from qutebrowser.config.config import ConfigContainer
from qutebrowser.config.configfiles import ConfigAPI

config: ConfigAPI = config
c: ConfigContainer = c

# Variables
defaultFont = "14px MonoLisa"
defaultZoom = "100%"
defaultPadding = {"top": 10, "bottom": 10, "left": 10, "right": 10}
startpageUrl = os.getenv("DEFAULT_STARTPAGE", "https://start.duckduckgo.com/")
searchEngineUrl = os.getenv("DEFAULT_SEARCH_ENGINE", "https://duckduckgo.com/")

# Config
config.load_autoconfig(False)
c.url.start_pages = [startpageUrl]
c.url.searchengines = {"DEFAULT": searchEngineUrl + "?q={}"}

c.zoom.default = defaultZoom

c.editor.command = ["kitty", "nvim", "{file}"]

c.fonts.tabs.selected = defaultFont
c.fonts.tabs.unselected = defaultFont
c.tabs.padding = defaultPadding
c.tabs.show = "multiple"

c.fonts.statusbar = defaultFont
c.statusbar.padding = defaultPadding

c.fonts.completion.category = defaultFont
c.fonts.completion.entry = defaultFont

c.content.notifications.enabled = False

c.colors.webpage.preferred_color_scheme = "dark"

# Bindings
config.bind(";gy", "hint links spawn --detach mpv --force-window yes {hint-url}")
config.bind(
    ";gb",
    'hint links spawn --detach mpvpaper -o "--scripts=/etc/mpv/scripts/mpris.so" --fork HDMI-A-1 {hint-url}',
)
config.bind(
    ";gw",
    "hint links spawn --output-messages bash -c \"wget '{hint-url}' -O /tmp/wally.hex && wally-cli /tmp/wally.hex && rm /tmp/wally.hex\"",
)
config.bind(";gp", "spawn --userscript capture-youtube")
config.bind(";gh", "hint links userscript capture-youtube")
config.bind(";gs", "spawn --userscript search-site")
config.bind("xx", "config-cycle tabs.show multiple switching")
config.unbind("D", mode="normal")

# Themeing
config.source("custom-catppuccin-color.py")
