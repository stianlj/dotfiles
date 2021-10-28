local opt = vim.opt
local g = vim.g
local cmd = vim.cmd

g.mapleader = " "

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

cmd([[ autocmd BufRead * if getline(1) == '#!/bin/dash' | set filetype=sh | endif ]])

require("plugins/lsp-config")
