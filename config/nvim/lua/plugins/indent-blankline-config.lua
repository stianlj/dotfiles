vim.cmd([[highlight IndentBlanklineContextChar guifg=#e0af68 gui=nocombine]])

require("indent_blankline").setup({
  use_treesitter = true,
  space_char_blankline = " ",
  show_current_line = true,
  show_current_context = true,
})
