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
o.relativenumber = true
o.mouse = "a"
o.swapfile = false
o.splitbelow = true
o.splitright = true
o.hidden = true
o.wrap = false
o.cursorline = true
o.list = true
o.listchars:append("space:⋅")
o.listchars:append("eol:↴")
--[[ o.spell = true ]]
o.spelllang = { "en", "nb" }
o.splitkeep = "screen"
o.conceallevel = 1
o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

o.clipboard:append("unnamedplus")

local function paste()
  return {
    vim.fn.getregtype(""),
    vim.fn.split(vim.fn.getreg(""), "\n"),
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

vim.o.cmdheight = 0
require('vim._core.ui2').enable({
  enable = true,
  msg = {
    targets = {
      [''] = 'msg',
      empty = 'cmd',
      bufwrite = 'msg',
      confirm = 'cmd',
      emsg = 'pager',
      echo = 'msg',
      echomsg = 'msg',
      echoerr = 'pager',
      completion = 'cmd',
      list_cmd = 'pager',
      lua_error = 'pager',
      lua_print = 'msg',
      progress = 'pager',
      rpc_error = 'pager',
      quickfix = 'msg',
      search_cmd = 'cmd',
      search_count = 'cmd',
      shell_cmd = 'pager',
      shell_err = 'pager',
      shell_out = 'pager',
      shell_ret = 'msg',
      undo = 'msg',
      verbose = 'pager',
      wildlist = 'cmd',
      wmsg = 'msg',
      typed_cmd = 'cmd',
    },
    cmd = {
      height = 0.5,
    },
    dialog = {
      height = 0.5,
    },
    msg = {
      height = 0.3,
      timeout = 5000,
    },
    pager = {
      height = 0.5,
    },
  },
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "msg",
  callback = function()
    local ui2 = require("vim._core.ui2")
    local win = ui2.wins and ui2.wins.msg
    if win and vim.api.nvim_win_is_valid(win) then
      vim.api.nvim_set_option_value(
        "winhighlight",
        "Normal:NormalFloat,FloatBorder:FloatBorder",
        { scope = "local", win = win }
      )
    end
  end,
})

local ui2 = require("vim._core.ui2")
local msgs = require("vim._core.ui2.messages")
local orig_set_pos = msgs.set_pos
msgs.set_pos = function(tgt)
  orig_set_pos(tgt)
  if (tgt == "msg" or tgt == nil) and vim.api.nvim_win_is_valid(ui2.wins.msg) then
    pcall(vim.api.nvim_win_set_config, ui2.wins.msg, {
      relative = "editor",
      anchor = "NE",
      row = 1,
      col = vim.o.columns - 1,
      border = "rounded",
    })
  end
end

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
