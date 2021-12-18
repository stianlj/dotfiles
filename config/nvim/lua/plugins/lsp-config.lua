local lsp_installer = require("nvim-lsp-installer")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

local lsp = vim.lsp

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

  if server.name == "tsserver" then
    opts.on_attach = function(client)
      client.resolved_capabilities.document_formatting = false
      client.resolved_capabilities.document_range_formatting = false
      on_attach(client)
    end
  end

  if server.name == "yamlls" then
    opts.settings = {
      yaml = {
        validate = true,
        schemas = {
          ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
          ["kubernetes"] = "/.kubernetes/*.yaml",
        },
      },
    }
  end

  if server.name == "jsonls" then
    opts.settings = {
      json = {
        schemas = {
          {
            fileMatch = { "package.json" },
            url = "https://json.schemastore.org/package.json",
          },
        },
      },
    }
  end

  if server.name == "intelephense" then
    opts.settings = {
      intelephense = {
        stubs = {
          "bcmath",
          "bz2",
          "calendar",
          "Core",
          "curl",
          "date",
          "dba",
          "dom",
          "enchant",
          "fileinfo",
          "filter",
          "ftp",
          "gd",
          "gettext",
          "hash",
          "iconv",
          "imap",
          "intl",
          "json",
          "ldap",
          "libxml",
          "mbstring",
          "mcrypt",
          "mysql",
          "mysqli",
          "password",
          "pcntl",
          "pcre",
          "PDO",
          "pdo_mysql",
          "Phar",
          "readline",
          "recode",
          "Reflection",
          "regex",
          "session",
          "SimpleXML",
          "soap",
          "sockets",
          "sodium",
          "SPL",
          "standard",
          "superglobals",
          "sysvsem",
          "sysvshm",
          "tokenizer",
          "xml",
          "xdebug",
          "xmlreader",
          "xmlwriter",
          "yaml",
          "zip",
          "zlib",
          "wordpress",
          "woocommerce",
          "acf-pro",
          "wordpress-globals",
          "wp-cli",
          "genesis",
          "polylang",
        },
        files = {
          maxSize = 5000000,
        },
      },
    }
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
