# Variables
defaultFont = "20px Hack Nerd Font"
defaultPadding = {"top": 10, "bottom": 10, "left": 10, "right": 10}

# Config
c.url.start_pages = ["https://duckduckgo.com"]
c.url.searchengines = {'DEFAULT': 'https://duckduckgo.com/?q={}'}

c.zoom.default = '150%'

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
