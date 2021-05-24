from qutebrowser.config.configfiles import ConfigAPI
from qutebrowser.config.config import ConfigContainer
import os

config: ConfigAPI = config
c: ConfigContainer = c

# Variables
defaultFont = "14px JetBrainsMonoMedium Nerd Font Mono"
defaultZoom = "100%"
defaultPadding = {"top": 10, "bottom": 10, "left": 10, "right": 10}

if os.environ['COMPUTER_IDENTIFIER'] == 'work-laptop':
    defaultFont = "15px Hack Nerd Font"
    defaultZoom = "100%"

# Config
config.load_autoconfig(False)
c.url.start_pages = ["https://start.duckduckgo.com"]
c.url.searchengines = {'DEFAULT': 'https://duckduckgo.com/?q={}'}

c.zoom.default = defaultZoom

c.fonts.tabs.selected = defaultFont
c.fonts.tabs.unselected = defaultFont
c.tabs.padding = defaultPadding
c.tabs.show = 'multiple'

c.fonts.statusbar = defaultFont
c.statusbar.padding = defaultPadding

c.fonts.completion.category = defaultFont
c.fonts.completion.entry = defaultFont

c.content.notifications.enabled = False

c.colors.webpage.preferred_color_scheme = 'dark'

# Bindings
config.bind(';gy', 'hint links spawn --detach mpv --force-window yes {hint-url}')
config.bind(';gw', 'hint links spawn --output-messages bash -c "wget \'{hint-url}\' -O /tmp/wally.hex && wally-cli /tmp/wally.hex && rm /tmp/wally.hex"')
config.bind(';gp', 'spawn --userscript capture-youtube')
config.bind(';gh', 'hint links userscript capture-youtube')
config.bind(';gs', 'spawn --userscript search-site')
config.bind(';gb', 'spawn buku -a {url}')
config.bind('xx', 'config-cycle tabs.show multiple switching')
config.unbind('D', mode='normal')

# Themeing
config.source('custom-color.py')
