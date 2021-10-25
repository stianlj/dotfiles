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
opt.mouse = 'a'
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true

cmd([[ autocmd BufRead * if getline(1) == '#!/bin/dash' | set filetype=sh | endif ]])

local lsp_installer = require('nvim-lsp-installer')
lsp_installer.on_server_ready(function(server)
  server:setup()
  cmd([[ do User LspAttachBuffers ]])
end)
