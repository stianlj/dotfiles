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
opt.hidden = true

cmd([[ autocmd BufRead * if getline(1) == '#!/bin/dash' | set filetype=sh | endif ]])

local lsp_installer = require('nvim-lsp-installer')
lsp_installer.on_server_ready(function(server)
  server:setup()
  cmd([[ do User LspAttachBuffers ]])
end)

local lspconfig = require('lspconfig')
local on_attach = function(_, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  -- local function buf_set_option(...) vim.api.nvim_buf_get_option(bufnr, ...)  end

  local opts = { noremap = true, silent = true }
  buf_set_keymap('n', '<leader>cr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
end

local servers = { 'tsserver', 'eslint', 'sumneko_lua' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150
    }
  })
end
