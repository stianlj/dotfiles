local cmp_nvim_lsp = require("cmp_nvim_lsp")

vim.diagnostic.config({
  virtual_text = false,
})

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "bashls",
    "pyright",
    "emmet_ls",
    "lua_ls",
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

require("neodev").setup({})

-- https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization#customizing-how-diagnostics-are-displayed
local default_on_attach = function(_, bufnr)
  vim.api.nvim_create_autocmd("CursorHold", {
    buffer = bufnr,
    callback = function()
      local opts = {
        focusable = false,
        close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
        border = "rounded",
        source = "always",
        prefix = " ",
        scope = "cursor",
      }
      vim.diagnostic.open_float(nil, opts)
    end,
  })
end

local lsp_config = require("lspconfig")

lsp_config.util.default_config = vim.tbl_extend("force", lsp_config.util.default_config, {
  on_attach = default_on_attach,
  capabilities = cmp_nvim_lsp.default_capabilities(),
})

lsp_config.bashls.setup({})
lsp_config.pyright.setup({})
lsp_config.emmet_ls.setup({})
lsp_config.tsserver.setup({})
lsp_config.svelte.setup({})
lsp_config.gopls.setup({})
lsp_config.golangci_lint_ls.setup({})
lsp_config.lua_ls.setup({
  settings = {
    Lua = {
      completion = {
        callSnippet = "Replace",
      },
    },
  },
})
lsp_config.jsonls.setup({
  settings = {
    json = {
      schemas = {
        {
          fileMatch = { "package.json" },
          url = "https://json.schemastore.org/package.json",
        },
      },
    },
  },
})
lsp_config.eslint.setup({
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
    "vue",
    "svelte",
  },
})
lsp_config.intelephense.setup({
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
  },
})
lsp_config.yamlls.setup({
  settings = {
    yaml = {
      validate = true,
      schemas = {
        ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
        ["kubernetes"] = "/.kubernetes/*.yaml",
      },
    },
  },
})
