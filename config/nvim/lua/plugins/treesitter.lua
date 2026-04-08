return {
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    config = {
      enable_autocmd = false,
    },
  },
  {
    "Wansmer/treesj",
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
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    event = "BufReadPost",
    dependencies = {
      { "nvim-treesitter/nvim-treesitter-textobjects", branch = "main" },
    },
    config = function()
      local ensure_installed = {
        "javascript",
        "json",
        "jsdoc",
        "jinja",
        "svelte",
        "typescript",
        "tsx",
        "html",
        "comment",
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
        "markdown_inline",
        "http",
        "hurl",
        "dockerfile",
        "diff",
        "vim",
        "vimdoc",
        "regex",
      }

      local already_installed = require("nvim-treesitter.config").get_installed()
      local parsers_to_install = vim
        .iter(ensure_installed)
        :filter(function(parser)
          return not vim.tbl_contains(already_installed, parser)
        end)
        :totable()

      if #parsers_to_install > 0 then
        require("nvim-treesitter").install(parsers_to_install)
      end

      vim.api.nvim_create_autocmd("FileType", {
        callback = function()
          pcall(vim.treesitter.start)
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })

      vim.keymap.set("n", "<CR>", function()
        local inc_sel = require("nvim-treesitter.incremental_selection")
        if vim.fn.mode() == "n" then
          inc_sel.init_selection()
        else
          inc_sel.node_incremental()
        end
      end, { desc = "Treesitter incremental selection" })

      vim.keymap.set("x", "<CR>", function()
        require("nvim-treesitter.incremental_selection").node_incremental()
      end, { desc = "Treesitter node incremental" })

      vim.keymap.set("x", "<S-CR>", function()
        require("nvim-treesitter.incremental_selection").scope_incremental()
      end, { desc = "Treesitter scope incremental" })

      vim.keymap.set("x", "<BS>", function()
        require("nvim-treesitter.incremental_selection").node_decremental()
      end, { desc = "Treesitter node decremental" })

      local ts_select = require("nvim-treesitter-textobjects.select")
      vim.keymap.set({ "o", "x" }, "af", function()
        ts_select.select_textobject("@function.outer", "textobjects")
      end, { desc = "Select function outer" })

      vim.keymap.set({ "o", "x" }, "if", function()
        ts_select.select_textobject("@function.inner", "textobjects")
      end, { desc = "Select function inner" })

      vim.keymap.set({ "o", "x" }, "ac", function()
        ts_select.select_textobject("@class.outer", "textobjects")
      end, { desc = "Select class outer" })

      vim.keymap.set({ "o", "x" }, "ic", function()
        ts_select.select_textobject("@class.inner", "textobjects")
      end, { desc = "Select class inner" })
    end,
  },
}
