local cmd = vim.cmd
local lspconfig = require('lspconfig')

lspconfig.tsserver.setup({})
lspconfig.eslint.setup({})
lspconfig.sunmeko_lua.setup({})
