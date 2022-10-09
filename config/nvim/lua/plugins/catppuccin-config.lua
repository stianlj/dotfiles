vim.g.catppuccin_flavour = "mocha"

require("catppuccin").setup({
  transparent_background = false,
  dim_inactive = {
    enabled = true,
    percentage = 0.5,
  },
})

vim.api.nvim_command("colorscheme catppuccin")
