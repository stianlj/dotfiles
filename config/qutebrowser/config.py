import os

# Variables
defaultFont = "20px Hack Nerd Font"
defaultZoom = "150%"
defaultPadding = {"top": 10, "bottom": 10, "left": 10, "right": 10}

if os.environ['COMPUTER_IDENTIFIER'] == 'work-laptop':
    defaultFont = "15px Hack Nerd Font"
    defaultZoom = "100%"

# Config
c.url.start_pages = ["https://start.duckduckgo.com"]
c.url.searchengines = {'DEFAULT': 'https://duckduckgo.com/?q={}'}

c.zoom.default = defaultZoom

c.fonts.tabs = defaultFont
c.tabs.padding = defaultPadding

c.fonts.statusbar = defaultFont
c.statusbar.padding = defaultPadding

c.fonts.completion.category = defaultFont
c.fonts.completion.entry = defaultFont

c.content.notifications = False

# Bindings
config.bind(';gy', 'hint links spawn --detach mpv --force-window yes {hint-url}')
config.bind(';gs', 'spawn --userscript search-site')
config.bind(';gb', 'spawn buku -a {url}')

# Themeing
config.source('nord-qutebrowser.py')
