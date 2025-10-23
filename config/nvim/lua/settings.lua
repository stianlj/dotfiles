local o = vim.opt
local g = vim.g

-- TODO: Use https://github.com/m4xshen/autoclose.nvim
-- https://github.com/barrett-ruth/import-cost.nvim
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
o.fillchars:append({ diff = "╱" })
-- o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
-- o.foldtext = "v:lua.vim.treesitter.foldtext()"
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
o.cmdheight = 1
o.listchars:append("space:⋅")
o.listchars:append("eol:↴")
--[[ o.spell = true ]]
o.spelllang = { "en", "nb" }
o.splitkeep = "screen"
o.conceallevel = 1

o.clipboard = "unnamedplus"

local function paste()
  return {
    vim.fn.split(vim.fn.getreg(""), "\n"),
    vim.fn.getregtype(""),
  }
end

g.clipboard = {
  name = "OSC 52",
  copy = {
    ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
    ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
  },
  paste = {
    ["+"] = paste,
    ["*"] = paste,
  },
}

require("lazy").setup({
  { import = "plugins" },
  { import = "plugins.lsp" },
})

vim.lsp.config("copilot", {
  settings = {
    telemetry = { enabled = false },
  },
})

vim.lsp.config("lua_ls", {
  telemetry = { enabled = false },
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      diagnostics = {
        globals = {
          "vim",
          "require",
        },
      },
    },
  },
})

vim.lsp.config("jsonls", {
  settings = {
    json = {
      schemas = require("schemastore").json.schemas(),
      validate = { enable = true },
    },
  },
})

vim.lsp.config("yamlls", {
  settings = {
    json = {
      schemas = require("schemastore").json.schemas(),
      validate = { enable = true },
    },
  },
})

vim.lsp.enable("ansiblels")
vim.lsp.enable("bashls")
vim.lsp.enable("copiloto")
vim.lsp.enable("jsonls")
vim.lsp.enable("docker_compose_language_service")
vim.lsp.enable("emmet_ls")
vim.lsp.enable("eslint")
vim.lsp.enable("lua_ls")
vim.lsp.enable("svelte")
vim.lsp.enable("vtsls")
vim.lsp.enable("yamlls")

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "󰅚",
      [vim.diagnostic.severity.WARN] = "󰀪",
      [vim.diagnostic.severity.HINT] = "󰌶",
      [vim.diagnostic.severity.INFO] = "",
    },
  },
  -- virtual_lines = {
  --   current_line = true,
  -- },
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("my.lsp", {}),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    if
      not client:supports_method("textDocument/willSaveWaitUntil")
      and client:supports_method("textDocument/formatting")
    then
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = vim.api.nvim_create_augroup("my.lsp", { clear = false }),
        buffer = args.buf,
        callback = function()
          vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
        end,
      })
    end
  end,
})

vim.filetype.add({
  pattern = {
    [".*/.*playbook.*.ya?ml"] = "yaml.ansible",
    [".*/.*tasks.*/.*ya?ml"] = "yaml.ansible",
    [".*/.*group_vars.*/.*ya?ml"] = "yaml.ansible",
    [".*/.*host_vars.*/.*ya?ml"] = "yaml.ansible",
    [".*/local.ya?ml"] = "yaml.ansible",
    [".*-ansible/.*ya?ml"] = "yaml.ansible",
    ["compose.*%.ya?ml"] = "yaml.docker-compose",
    ["docker%-compose.*%.ya?ml"] = "yaml.docker-compose",
  },
})

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
