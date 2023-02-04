--[[ local colors = require("tokyonight.colors").setup({}) ]]
--[[]]
--[[ vim.cmd("highlight TreesitterContext guibg=" .. colors.fg_gutter) ]]

require("treesitter-context").setup({
  max_lines = 3,
})
