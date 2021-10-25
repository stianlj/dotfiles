local cmd = vim.cmd

local lsp_installer = require('nvim-lsp-installer')
lsp_installer.on_server_ready(function(server)
  server:setup()
  cmd([[ do User LspAttachBuffers ]])
end)

local lspconfig = require('lspconfig')
local servers = { 'tsserver', 'eslint', 'sumneko_lua' }
for _, server in ipairs(servers) do
  lspconfig[server].setup({
    flags = {
      debounce_text_changes = 150
    }
  })
end
