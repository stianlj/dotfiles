local cmd = vim.cmd

local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)
  server:setup()
  cmd([[ do User LspAttachBuffers ]])
end)

local lspconfig = require("lspconfig")

local default_opts = {
  flags = {
    debounce_text_changes = 150,
  },
}
lspconfig.tsserver.setup(default_opts)
lspconfig.eslint.setup(default_opts)
lspconfig.sumneko_lua.setup(default_opts)
lspconfig.bashls.setup(default_opts)
lspconfig.intelephense.setup({
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
