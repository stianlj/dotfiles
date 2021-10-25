local lspconfig = require('lspconfig')

local on_attach = function(_, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  -- local function buf_set_option(...) vim.api.nvim_buf_get_option(bufnr, ...)  end

  local opts = { noremap = true, silent = true }
  buf_set_keymap('n', '<leader>cr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
end

local servers = { 'tsserver', 'eslint', 'sunmeko_lua' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150
    }
  })
end
