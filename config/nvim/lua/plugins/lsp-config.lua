local lsp_installer = require("nvim-lsp-installer")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

local cmd = vim.cmd
local lsp = vim.lsp

local builtin_lsp_servers = {
  "bashls",
  "pyright",
  "sumneko_lua",
  "intelephense",
  "yamlls",
  "tsserver",
  "eslint",
  "jsonls",
}

lsp.handlers["textDocument/hover"] = lsp.with(lsp.handlers.hover, { border = "rounded" })
lsp.handlers["textDocument/signatureHelp"] = lsp.with(lsp.handlers.signature_help, { border = "rounded" })

lsp_installer.on_server_ready(function(server)
  local opts = {
    capabilities = cmp_nvim_lsp.update_capabilities(lsp.protocol.make_client_capabilities()),
    flags = {
      debounce_text_changes = 150,
    },
  }

  if server.name == "sumneko_lua" then
    opts.settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
      },
    }
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
  cmd([[ do User LspAttachBuffers ]])
end)

for _, lsp_name in ipairs(builtin_lsp_servers) do
  local ok, _lsp = require("nvim-lsp-installer.servers").get_server(lsp_name)
  if ok and not _lsp:is_installed() then
    vim.defer_fn(function()
      lsp_installer.install(lsp_name)
    end, 0)
  end
end
