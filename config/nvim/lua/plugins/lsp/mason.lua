return {
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      handlers = {
        function(server_name)
          require("lspconfig")[server_name].setup({})
        end,

        jsonls = function()
          require("lspconfig").jsonls.setup({
            settings = {
              json = {
                schemas = require("schemastore").json.schemas(),
                validate = { enable = true },
              },
            },
          })
        end,
      },

      yamlls = function()
        require("lspconfig").yamlls.setup({
          settings = {
            yaml = {
              schemas = require("schemastore").yaml.schemas(),
              validate = true,
            },
          },
        })
      end,

      lua_ls = function()
        require("lspconfig").lua_ls.setup({
          telemetry = { enabled = false },
          settings = {
            Lua = {
              runtime = {
                version = "LuaJIT",
              },
              diagnostics = {
                globals = {
                  "vim",
                  "require",
                },
              },
            },
          },
        })
      end,
    },
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "ansiblels",
        "ansible-lint",
        "bashls",
        "docker_compose_language_service",
        "emmet_language_server",
        "eslint",
        "jsonls",
        "kulala-fmt",
        "lua_ls",
        "svelte",
        "vtsls",
        "woke",
        "write-good",
        "yamlls",
        "yamllint",
      },
    },
  },
}
