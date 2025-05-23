return {
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    config = {
      enable_autocmd = false,
    },
  },
  {
    "Wansmer/treesj",
    -- [[ keys = { "<space>m", "<space>j", "<space>s" }, ]]
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = true,
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    lazy = false,
    config = function()
      local rainbow_delimiters = require("rainbow-delimiters")

      vim.g.rainbow_delimiters = {
        strategy = {
          [""] = rainbow_delimiters.strategy["global"],
          vim = rainbow_delimiters.strategy["local"],
        },
        query = {
          [""] = "rainbow-delimiters",
          lua = "rainbow-blocks",
        },
        highlight = {
          "RainbowDelimiterRed",
          "RainbowDelimiterYellow",
          "RainbowDelimiterBlue",
          "RainbowDelimiterOrange",
          "RainbowDelimiterGreen",
          "RainbowDelimiterViolet",
          "RainbowDelimiterCyan",
        },
      }
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-refactor",
    dependencies = "nvim-treesitter/nvim-treesitter",
  },
  --[[ { ]]
  --[[   "nvim-treesitter/nvim-treesitter-context", ]]
  --[[   config = function() ]]
  --[[     require("treesitter-context").setup({ ]]
  --[[       max_lines = 3, ]]
  --[[     }) ]]
  --[[   end, ]]
  --[[ }, ]]
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "BufReadPost",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "nvim-treesitter/playground",
      { "nushell/tree-sitter-nu", build = ":TSUpdate nu" },
    },
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "javascript",
          "json",
          "jsonc",
          "jsdoc",
          "svelte",
          "typescript",
          "tsx",
          "html",
          "css",
          "lua",
          "luadoc",
          "php",
          "bash",
          "fish",
          "gitcommit",
          "gitignore",
          "go",
          "python",
          "rust",
          "make",
          "graphql",
          "sql",
          "jq",
          "yaml",
          "toml",
          "kdl",
          "markdown",
          "http",
          "hurl",
          "dockerfile",
          "diff",
          "vim",
          "vimdoc",
          "regex",
        },
        highlight = {
          enable = true,
          use_languagetree = true,
          additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = true,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<CR>",
            node_incremental = "<CR>",
            scope_incremental = "<S-CR>",
            node_decremental = "<BS>",
          },
        },
        refactor = {
          highlight_definitions = {
            enable = true,
            clear_on_cursor_move = true,
          },
          navigation = {
            enable = true,
            keymaps = {
              goto_next_usage = "<leader>cn",
              goto_previous_usage = "<leader>cp",
            },
          },
          smart_rename = {
            enable = true,
            keymaps = {
              smart_rename = "<leader>cr",
            },
          },
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true, -- automatically jump forward to matching textobj
            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
            },
          },
        },
        playground = {
          enable = true,
          disable = {},
          updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
          persist_queries = false, -- Whether the query persists across vim sessions
          keybindings = {
            toggle_query_editor = "o",
            toggle_hl_groups = "i",
            toggle_injected_languages = "t",
            toggle_anonymous_nodes = "a",
            toggle_language_display = "I",
            focus_language = "f",
            unfocus_language = "F",
            update = "R",
            goto_node = "<cr>",
            show_help = "?",
          },
        },
      })
    end,
  },
}
