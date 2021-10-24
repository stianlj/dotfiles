local g = vim.g
local cmd = vim.cmd

g.material_disable_background = true
g.material_style = "deep ocean"

require('material').setup()

cmd[[colorscheme material]]
