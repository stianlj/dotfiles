# Variables
defaultFont = "20px Hack Nerd Font"
defaultPadding = {"top": 10, "bottom": 10, "left": 10, "right": 10}

# Config
c.url.start_pages = ["https://google.com"]
c.url.searchengines = {
    'DEFAULT': 'https://www.google.com/search?q={}',
    'd': 'https://duckduckgo.com/?q={}'
}

c.zoom.default = '150%'

c.fonts.tabs = defaultFont
c.tabs.padding = defaultPadding

c.fonts.statusbar = defaultFont
c.statusbar.padding = defaultPadding

c.fonts.completion.category = defaultFont
c.fonts.completion.entry = defaultFont

# Bindings
config.bind('<Ctrl-Shift-y>', 'hint links spawn --detach mpv --force-window yes {hint-url}')

# Themeing
config.source('nord-qutebrowser.py')
