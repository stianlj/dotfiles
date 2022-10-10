vim.g.catppuccin_flavour = "mocha"
local colors = require("catppuccin.palettes").get_palette()

require("catppuccin").setup({
  dim_inactive = {
    enabled = true,
  },
  custom_highlights = {
    IndentBlanklineContextChar = { fg = colors.yellow },
  },
})

vim.api.nvim_command("colorscheme catppuccin")
