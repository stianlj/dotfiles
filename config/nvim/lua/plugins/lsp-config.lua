local lsp_installer = require("nvim-lsp-installer")
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local fns = require("functions")

local lsp = vim.lsp

-- TODO: Make this a multidimensional table with some attributes, instead of three tables
local builtin_lsp_servers = {
  "bashls",
  "pyright",
  "sumneko_lua",
  "intelephense",
  "yamlls",
  "tsserver",
  "svelte",
  "eslint",
  "jsonls",
}

local disabled_formatting = {
  "tsserver",
  "jsonls",
  "svelte",
  "intelephense",
}

local external_opt_lsp = {
  "yamlls",
  "jsonls",
  "intelephense",
}

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
  if fns.has_value(disabled_formatting, client.name) then
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
  end
  lsp_highlight_document(client)
end

local merge_lsp_opts = function(server_name, opts)
  local external_opts = require("plugins.lsp-servers." .. server_name)
  return vim.tbl_deep_extend("force", external_opts, opts)
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

  if fns.has_value(external_opt_lsp, server.name) then
    opts = merge_lsp_opts(server.name, opts)
  end

  server:setup(opts)
  vim.cmd([[ do User LspAttachBuffers ]])
end)

for _, lsp_name in ipairs(builtin_lsp_servers) do
  local ok, lsp_server = require("nvim-lsp-installer.servers").get_server(lsp_name)
  if ok and not lsp_server:is_installed() then
    vim.defer_fn(function()
      lsp_installer.install(lsp_name)
    end, 0)
  end
end
