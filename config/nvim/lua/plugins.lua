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
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.localleader = " "

require("lazy").setup("plugins")
