local lsp_installer = require("nvim-lsp-installer")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

local lsp = vim.lsp

local builtin_lsp_servers = {
  bashls = {},
  pyright = {},
  sumneko_lua = {},
  intelephense = {
    disable_format = true,
    require_opts = true,
  },
  yamlls = {
    require_opts = true,
  },
  tsserver = {
    disable_format = true,
  },
  svelte = {
    disable_format = true,
  },
  eslint = {},
  jsonls = {
    disable_format = true,
    require_opts = true,
  },
}

local disabled_formatting = vim.tbl_filter(function(client)
  if builtin_lsp_servers[client].disable_format then
    return true
  end
end, vim.tbl_keys(builtin_lsp_servers))

local external_opt_lsp = vim.tbl_filter(function(client)
  if builtin_lsp_servers[client].require_opts then
    return true
  end
end, vim.tbl_keys(builtin_lsp_servers))

local function lsp_highlight_document(client)
  if client.resolved_capabilities.document_highlight then
    vim.cmd([[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]])
  end
end

lsp.handlers["textDocument/hover"] = lsp.with(lsp.handlers.hover, { border = "rounded" })
lsp.handlers["textDocument/signatureHelp"] = lsp.with(lsp.handlers.signature_help, { border = "rounded" })

local on_attach = function(client)
  if vim.tbl_contains(disabled_formatting, client.name) then
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
  end
  lsp_highlight_document(client)
end

lsp_installer.on_server_ready(function(server)
  local opts = {
    on_attach = on_attach,
    capabilities = cmp_nvim_lsp.update_capabilities(lsp.protocol.make_client_capabilities()),
    flags = {
      debounce_text_changes = 150,
    },
  }

  if server.name == "sumneko_lua" then
    local luadev = require("lua-dev").setup({
      lspconfig = opts,
    })
    opts = luadev
  end

  if vim.tbl_contains(external_opt_lsp, server.name) then
    local local_opts = require("plugins.lsp-servers." .. server.name)
    opts = vim.tbl_deep_extend("force", local_opts, opts)
  end

  server:setup(opts)
  vim.cmd([[ do User LspAttachBuffers ]])
end)

for _, lsp_name in ipairs(vim.tbl_keys(builtin_lsp_servers)) do
  local ok, lsp_server = require("nvim-lsp-installer.servers").get_server(lsp_name)
  if ok and not lsp_server:is_installed() then
    vim.defer_fn(function()
      lsp_installer.install(lsp_name)
    end, 0)
  end
end
