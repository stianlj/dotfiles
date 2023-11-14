return {
  {
    "VonHeikemen/lsp-zero.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/nvim-cmp",
      "onsails/lspkind-nvim",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-emoji",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
    branch = "v3.x",
    config = function()
      local lsp_zero = require("lsp-zero")
      lsp_zero.extend_lspconfig()
      local lsp_config = require("lspconfig")

      lsp_zero.on_attach(function(_, bufnr)
        lsp_zero.default_keymaps({ buffer = bufnr })
      end)

      lsp_zero.set_server_config({
        capabilities = {
          textDocument = {
            foldingRange = {
              dynamicRegistration = false,
              lineFoldingOnly = true,
            },
          },
        },
      })

      require("mason").setup({})
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
          "rust_analyzer",
        },
        handlers = {
          lsp_zero.default_setup,
          lua_ls = function()
            local lua_opts = lsp_zero.nvim_lua_ls()
            lsp_config.lua_ls.setup(lua_opts)
          end,
          tsserver = lsp_zero.noop,
          jsonls = function()
            lsp_config.jsonls.setup({
              settings = {
                json = {
                  schemas = require("schemastore").json.schemas(),
                  validate = { enable = true },
                },
              },
            })
          end,
          eslint = function()
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
          end,
          intelephense = function()
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
          end,
          yamlls = function()
            lsp_config.yamlls.setup({
              settings = {
                yaml = {
                  schemaStore = {
                    enable = false,
                  },
                  schemas = require("schemastore").yaml.schemas(),
                  validate = true,
                },
              },
            })
          end,
        },
      })
      local cmp = require("cmp")
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      require("luasnip/loaders/from_vscode").lazy_load()
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        sources = {
          { name = "luasnip", keyword_length = 1 },
          { name = "nvim_lua" },
          { name = "nvim_lsp" },
          { name = "path" },
          { name = "vim-dadbod-completion" },
          { name = "buffer", keyword_length = 5 },
          { name = "emoji" },
        },
        mapping = {
          ["<Tab>"] = function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end,
          ["<S-Tab>"] = function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
          end,
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
          ["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
          ["<Down>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
          ["<Up>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
        },
        formatting = {
          fields = { "abbr", "kind", "menu" },
          format = require("lspkind").cmp_format({
            with_text = true,
            menu = {
              nvim_lsp = "[LSP]",
              nvim_lua = "[api]",
              luasnip = "[snip]",
              buffer = "[buf]",
              path = "[path]",
            },
            mode = "symbol", -- show only symbol annotations
            maxwidth = 50, -- prevent the popup from showing more than provided characters
            ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead
          }),
        },
      })
    end,
  },
}
