local cmp_nvim_lsp = require("cmp_nvim_lsp")
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "bashls",
    "pyright",
    "emmet_ls",
    "sumneko_lua",
    "intelephense",
    "yamlls",
    "tsserver",
    "svelte",
    "eslint",
    "jsonls",
    "gopls",
    "golangci_lint_ls",
  },
})

local capabilities = cmp_nvim_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())

local lsp_config = require("lspconfig")
lsp_config.bashls.setup({
  capabilities = capabilities,
})
lsp_config.pyright.setup({
  capabilities = capabilities,
})
lsp_config.emmet_ls.setup({
  capabilities = capabilities,
})
lsp_config.tsserver.setup({
  capabilities = capabilities,
})
lsp_config.svelte.setup({
  capabilities = capabilities,
})
lsp_config.gopls.setup({
  capabilities = capabilities,
})
lsp_config.golangci_lint_ls.setup({
  capabilities = capabilities,
})
lsp_config.sumneko_lua.setup({
  capabilities = capabilities,
  setup = function(config)
    local luadev = require("lua-dev").setup({
      lspconfig = config.opts
    })
    return luadev
  end
})
lsp_config.jsonls.setup({
  capabilities = capabilities,
  settings = {
    json = {
      schemas = {
        {
          fileMatch = { "package.json" },
          url = "https://json.schemastore.org/package.json",
        },
      },
    },
  }
})
lsp_config.eslint.setup({
  capabilities = capabilities,
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
    "vue",
    "svelte",
  }
})
lsp_config.intelephense.setup({
  capabilities = capabilities,
  settings = {
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
})
lsp_config.yamlls.setup({
  capabilities = capabilities,
  settings = {
    yaml = {
      validate = true,
      schemas = {
        ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
        ["kubernetes"] = "/.kubernetes/*.yaml",
      },
    },
  }
})
