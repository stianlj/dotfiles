vim.g.catppuccin_flavour = "frappe"
local colors = require("catppuccin.palettes").get_palette()

require("catppuccin").setup({
  dim_inactive = {
    enabled = true,
  },
  harpoon = true,
  styles = {
    comments = { "bold", "italic" },
    conditionals = { "italic" },
    loops = {},
    functions = {},
    keywords = { "italic" },
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = {},
    operators = {},
  },
  custom_highlights = {
    IndentBlanklineContextChar = { fg = colors.yellow },
  },
})

vim.api.nvim_command("colorscheme catppuccin")
