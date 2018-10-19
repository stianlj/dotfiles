import os

# Variables
defaultFont = "20px Hack Nerd Font"
defaultZoom = "150%"
defaultPadding = {"top": 10, "bottom": 10, "left": 10, "right": 10}

if os.environ['COMPUTER_IDENTIFIER'] == 'work-laptop':
    defaultFont = "15px Hack Nerd Font"
    defaultZoom = "125%"

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

# Bindings
config.bind(';my', 'hint links spawn --detach mpv --force-window yes {hint-url}')
config.bind(';ss', 'spawn --userscript search-site')

# Themeing
config.source('nord-qutebrowser.py')
