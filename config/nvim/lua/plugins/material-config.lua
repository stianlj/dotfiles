local g = vim.g
local cmd = vim.cmd

g.material_style = "deep ocean"

require("material").setup({
  italics = {
    comments = true,
    keywords = true,
    functions = true,
    strings = false,
    variables = true,
  },
  disable = {
    background = true,
  },
})

cmd([[colorscheme material]])
