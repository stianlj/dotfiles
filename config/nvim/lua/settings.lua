local o = vim.opt
local g = vim.g

-- TODO: Use https://github.com/m4xshen/autoclose.nvim
-- https://github.com/barrett-ruth/import-cost.nvim
-- https://github.com/danymat/neogen - JSDoc and such
-- https://www.youtube.com/watch?v=aqlxqpHs-aQ

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
o.rtp:prepend(lazypath)

g.mapleader = " "
g.localleader = " "
o.termguicolors = true

o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
o.foldcolumn = "1"
o.foldlevel = 99
o.foldlevelstart = 99
o.foldenable = true

g.cursorhold_updatetime = 200
o.colorcolumn = "100"
o.shell = "/usr/bin/fish"
o.expandtab = true
o.shiftwidth = 2
o.smartindent = true
o.tabstop = 2
o.number = true
o.relativenumber = true
o.mouse = "a"
o.swapfile = false
o.splitbelow = true
o.splitright = true
o.hidden = true
o.wrap = false
o.cursorline = true
o.list = true
o.cmdheight = 0
o.listchars:append("space:⋅")
o.listchars:append("eol:↴")
--[[ o.spell = true ]]
o.spelllang = { "en", "nb" }

require("lazy").setup("plugins")
require("custom-signs")

-- TODO: Use neovim built-in API instead of this
-- OR https://github.com/neovim/neovim/pull/16600#issuecomment-990409210
vim.cmd([[
  augroup configgrp
    autocmd BufRead * if getline(1) == '#!/bin/dash' | set filetype=sh | endif
    autocmd BufRead,BufNewFile *.PKGBUILD,PKGBUILD set filetype=PKGBUILD
    autocmd BufRead,BufNewFile swhkdrc set filetype=sxhkdrc
    autocmd BufRead,BufNewFile *.hurl set filetype=hurl
  augroup END
]])

vim.cmd([[
  augroup remember_folds
    autocmd!
    autocmd BufWinLeave *.* mkview
    autocmd BufWinEnter *.* silent! loadview
  augroup END
]])
