local opt = vim.opt
local g = vim.g

g.mapleader = " "
g.cursorhold_updatetime = 200

opt.colorcolumn = "100"
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.number = true
opt.relativenumber = true
opt.mouse = "a"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.hidden = true
opt.wrap = false
opt.cursorline = true

vim.cmd([[
  augroup configgrp
    autocmd BufRead * if getline(1) == '#!/bin/dash' | set filetype=sh | endif 
    autocmd BufRead,BufNewFile *.PKGBUILD,PKGBUILD set filetype=PKGBUILD 
  augroup END
]])

require("plugins/lsp-config")
