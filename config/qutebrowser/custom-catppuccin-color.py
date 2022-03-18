catppuccinPalette = {
    'rosewater': '#F5E0DC',
    'flamingo': '#F2CDCD',
    'mauve': '#DDB6F2',
    'pink': '#F5C2E7',
    'maroon': '#E8A2AF',
    'red': '#F28FAD',
    'peach': '#F8BD96',
    'yellow': '#FAE3B0',
    'green': '#ABE9B3',
    'teal': '#B5E8E0',
    'blue': '#96CDFB',
    'sky': '#89DCEB',
    'lavender': '#C9CBFF',
    'black0': '#161320',
    'black1': '#1A1826',
    'black2': '#1E1E2E',
    'black3': '#302D41',
    'black4': '#575268',
    'gray0': '#6E6C7E',
    'gray1': '#988BA2',
    'gray2': '#C3BAC6',
    'white': '#D9E0EE'
}

## Background color of the completion widget category headers.
## Type: QssColor
c.colors.completion.category.bg = catppuccinPalette['black0']

## Bottom border color of the completion widget category headers.
## Type: QssColor
c.colors.completion.category.border.bottom = catppuccinPalette['black0']

## Top border color of the completion widget category headers.
## Type: QssColor
c.colors.completion.category.border.top = catppuccinPalette['black0']

## Foreground color of completion widget category headers.
## Type: QtColor
c.colors.completion.category.fg = catppuccinPalette['white']

## Background color of the completion widget for even rows.
## Type: QssColor
c.colors.completion.even.bg = catppuccinPalette['black4']

## Background color of the completion widget for odd rows.
## Type: QssColor
c.colors.completion.odd.bg = catppuccinPalette['black4']

## Text color of the completion widget.
## Type: QtColor
c.colors.completion.fg = catppuccinPalette['white']

## Background color of the selected completion item.
## Type: QssColor
c.colors.completion.item.selected.bg = catppuccinPalette['black1']

## Bottom border color of the selected completion item.
## Type: QssColor
c.colors.completion.item.selected.border.bottom = catppuccinPalette['black1']

## Top border color of the completion widget category headers.
## Type: QssColor
c.colors.completion.item.selected.border.top = catppuccinPalette['black1']

## Foreground color of the selected completion item.
## Type: QtColor
c.colors.completion.item.selected.fg = catppuccinPalette['white']

## Foreground color of the matched text in the completion.
## Type: QssColor
c.colors.completion.match.fg = catppuccinPalette['black1']

## Color of the scrollbar in completion view
## Type: QssColor
c.colors.completion.scrollbar.bg = catppuccinPalette['blue']

## Color of the scrollbar handle in completion view.
## Type: QssColor
c.colors.completion.scrollbar.fg = catppuccinPalette['black0']

## Background color for the download bar.
## Type: QssColor
c.colors.downloads.bar.bg = catppuccinPalette['black0']

## Background color for downloads with errors.
## Type: QtColor
c.colors.downloads.error.bg = catppuccinPalette['red']

## Foreground color for downloads with errors.
## Type: QtColor
c.colors.downloads.error.fg = catppuccinPalette['white']

## Color gradient stop for download backgrounds.
## Type: QtColor
c.colors.downloads.stop.bg = catppuccinPalette['pink']

## Color gradient interpolation system for download backgrounds.
## Type: ColorSystem
## Valid values:
## - rgb: Interpolate in the RGB color system.
## - hsv: Interpolate in the HSV color system.
## - hsl: Interpolate in the HSL color system.
## - none: Don't show a gradient.
c.colors.downloads.system.bg = 'none'

## Background color for hints. Note that you can use a `rgba(...)` value
## for transparency.
## Type: QssColor
c.colors.hints.bg = catppuccinPalette['peach']

## Font color for hints.
## Type: QssColor
c.colors.hints.fg = catppuccinPalette['black1']

## Font color for the matched part of hints.
## Type: QssColor
c.colors.hints.match.fg = catppuccinPalette['gray2']

## Background color of the keyhint widget.
## Type: QssColor
c.colors.keyhint.bg = catppuccinPalette['black1']

## Text color for the keyhint widget.
## Type: QssColor
c.colors.keyhint.fg = catppuccinPalette['white']

## Highlight color for keys to complete the current keychain.
## Type: QssColor
c.colors.keyhint.suffix.fg = catppuccinPalette['maroon']

## Background color of an error message.
## Type: QssColor
c.colors.messages.error.bg = catppuccinPalette['yellow']

## Border color of an error message.
## Type: QssColor
c.colors.messages.error.border = catppuccinPalette['yellow']

## Foreground color of an error message.
## Type: QssColor
c.colors.messages.error.fg = catppuccinPalette['maroon']

## Background color of an info message.
## Type: QssColor
c.colors.messages.info.bg = catppuccinPalette['black1']

## Border color of an info message.
## Type: QssColor
c.colors.messages.info.border = catppuccinPalette['black1']

## Foreground color an info message.
## Type: QssColor
c.colors.messages.info.fg = catppuccinPalette['maroon']

## Background color of a warning message.
## Type: QssColor
c.colors.messages.warning.bg = catppuccinPalette['blue']

## Border color of a warning message.
## Type: QssColor
c.colors.messages.warning.border = catppuccinPalette['blue']

## Foreground color a warning message.
## Type: QssColor
c.colors.messages.warning.fg = catppuccinPalette['maroon']

## Background color for prompts.
## Type: QssColor
c.colors.prompts.bg = catppuccinPalette['black0']

# ## Border used around UI elements in prompts.
# ## Type: String
c.colors.prompts.border = '1px solid ' + catppuccinPalette['black0']

## Foreground color for prompts.
## Type: QssColor
c.colors.prompts.fg = catppuccinPalette['white']

## Background color for the selected item in filename prompts.
## Type: QssColor
c.colors.prompts.selected.bg = catppuccinPalette['sky']

## Background color of the statusbar in caret mode.
## Type: QssColor
c.colors.statusbar.caret.bg = catppuccinPalette['white']

## Foreground color of the statusbar in caret mode.
## Type: QssColor
c.colors.statusbar.caret.fg = catppuccinPalette['maroon']

## Background color of the statusbar in caret mode with a selection.
## Type: QssColor
c.colors.statusbar.caret.selection.bg = catppuccinPalette['white']

## Foreground color of the statusbar in caret mode with a selection.
## Type: QssColor
c.colors.statusbar.caret.selection.fg = catppuccinPalette['maroon']

## Background color of the statusbar in command mode.
## Type: QssColor
c.colors.statusbar.command.bg = catppuccinPalette['black2']

## Foreground color of the statusbar in command mode.
## Type: QssColor
c.colors.statusbar.command.fg = catppuccinPalette['white']

## Background color of the statusbar in private browsing + command mode.
## Type: QssColor
c.colors.statusbar.command.private.bg = catppuccinPalette['black2']

## Foreground color of the statusbar in private browsing + command mode.
## Type: QssColor
c.colors.statusbar.command.private.fg = catppuccinPalette['white']

## Background color of the statusbar in insert mode.
## Type: QssColor
c.colors.statusbar.insert.bg = catppuccinPalette['green']

## Foreground color of the statusbar in insert mode.
## Type: QssColor
c.colors.statusbar.insert.fg = catppuccinPalette['black1']

## Background color of the statusbar.
## Type: QssColor
c.colors.statusbar.normal.bg = catppuccinPalette['black0']

## Foreground color of the statusbar.
## Type: QssColor
c.colors.statusbar.normal.fg = catppuccinPalette['white']

## Background color of the statusbar in passthrough mode.
## Type: QssColor
c.colors.statusbar.passthrough.bg = catppuccinPalette['lavender']

## Foreground color of the statusbar in passthrough mode.
## Type: QssColor
c.colors.statusbar.passthrough.fg = catppuccinPalette['black1']

## Background color of the statusbar in private browsing mode.
## Type: QssColor
c.colors.statusbar.private.bg = catppuccinPalette['black0']

## Foreground color of the statusbar in private browsing mode.
## Type: QssColor
c.colors.statusbar.private.fg = catppuccinPalette['white']

## Background color of the progress bar.
## Type: QssColor
c.colors.statusbar.progress.bg = catppuccinPalette['maroon']

## Foreground color of the URL in the statusbar on error.
## Type: QssColor
c.colors.statusbar.url.error.fg = catppuccinPalette['red']

## Default foreground color of the URL in the statusbar.
## Type: QssColor
c.colors.statusbar.url.fg = catppuccinPalette['gray2']

## Foreground color of the URL in the statusbar for hovered links.
## Type: QssColor
c.colors.statusbar.url.hover.fg = catppuccinPalette['gray2']

## Foreground color of the URL in the statusbar on successful load
## (http).
## Type: QssColor
c.colors.statusbar.url.success.http.fg = catppuccinPalette['gray2']

## Foreground color of the URL in the statusbar on successful load
## (https).
## Type: QssColor
c.colors.statusbar.url.success.https.fg = catppuccinPalette['green']

## Foreground color of the URL in the statusbar when there's a warning.
## Type: QssColor
c.colors.statusbar.url.warn.fg = catppuccinPalette['pink']

## Background color of the tab bar.
## Type: QtColor
c.colors.tabs.bar.bg = catppuccinPalette['black0']

## Background color of unselected even tabs.
## Type: QtColor
c.colors.tabs.even.bg = catppuccinPalette['black0']

## Foreground color of unselected even tabs.
## Type: QtColor
c.colors.tabs.even.fg = catppuccinPalette['white']

## Color for the tab indicator on errors.
## Type: QtColor
c.colors.tabs.indicator.error = catppuccinPalette['red']

## Color gradient start for the tab indicator.
## Type: QtColor
# c.colors.tabs.indicator.start = catppuccinPalette['violet']

## Color gradient end for the tab indicator.
## Type: QtColor
# c.colors.tabs.indicator.stop = catppuccinPalette['orange']

## Color gradient interpolation system for the tab indicator.
## Type: ColorSystem
## Valid values:
## - rgb: Interpolate in the RGB color system.
## - hsv: Interpolate in the HSV color system.
## - hsl: Interpolate in the HSL color system.
## - none: Don't show a gradient.
c.colors.tabs.indicator.system = 'none'

## Background color of unselected odd tabs.
## Type: QtColor
c.colors.tabs.odd.bg = catppuccinPalette['black0']

## Foreground color of unselected odd tabs.
## Type: QtColor
c.colors.tabs.odd.fg = catppuccinPalette['white']

# ## Background color of selected even tabs.
# ## Type: QtColor
c.colors.tabs.selected.even.bg = catppuccinPalette['black3']

# ## Foreground color of selected even tabs.
# ## Type: QtColor
c.colors.tabs.selected.even.fg = catppuccinPalette['white']

# ## Background color of selected odd tabs.
# ## Type: QtColor
c.colors.tabs.selected.odd.bg = catppuccinPalette['black3']

# ## Foreground color of selected odd tabs.
# ## Type: QtColor
c.colors.tabs.selected.odd.fg = catppuccinPalette['white']

## Background color for webpages if unset (or empty to use the theme's
## color)
## Type: QtColor
# c.colors.webpage.bg = 'white'
