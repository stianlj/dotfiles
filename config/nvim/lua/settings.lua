local o = vim.opt
local g = vim.g

g.mapleader = " "
g.cursorhold_updatetime = 200
g.indent_blankline_use_tresitter = true
g.indent_blankline_context_highlight_list = {'class', 'function', 'method'}
g.nvim_tree_highlight_opened_files = 1
g.nvim_tree_icons = {
  default = "",
  git = {
    ignored = "◌",
  },
}

o.colorcolumn = "100"
o.expandtab = true
o.shiftwidth = 2
o.smartindent = true
o.tabstop = 2
o.number = true
o.relativenumber = true
o.mouse = "a"
o.splitbelow = true
o.splitright = true
o.termguicolors = true
o.hidden = true
o.wrap = false
o.cursorline = true

vim.cmd([[
  augroup configgrp
    autocmd BufRead * if getline(1) == '#!/bin/dash' | set filetype=sh | endif
    autocmd BufRead,BufNewFile *.PKGBUILD,PKGBUILD set filetype=PKGBUILD
  augroup END
]])

require("plugins/lsp-config")
