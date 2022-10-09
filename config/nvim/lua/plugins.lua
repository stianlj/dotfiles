local packer = require("packer")

require("packer_compiled")

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

packer.reset()
packer.init({
  compile_path = vim.fn.stdpath("config") .. "/lua/packer_compiled.lua",
})

return packer.startup(function(use)
  use("lewis6991/impatient.nvim")
  use("dstein64/vim-startuptime")
  use("wbthomason/packer.nvim")
  use("JoosepAlviste/nvim-ts-context-commentstring")
  use({
    "numToStr/Comment.nvim",
    config = function()
      require("plugins.comment-config")
    end,
  })
  use({
    "phaazon/hop.nvim",
    branch = "v1",
    config = function()
      require("plugins.hop-config")
    end,
  })
  use({
    "akinsho/bufferline.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    tag = "*",
    config = function()
      require("plugins.bufferline-config")
    end,
  })
  use("wakatime/vim-wakatime")
  use("tpope/vim-surround")
  use("tpope/vim-repeat")
  use("tpope/vim-obsession")
  use("tpope/vim-eunuch")
  use("tpope/vim-sleuth")
  use("elkowar/yuck.vim")
  use("gpanders/nvim-parinfer")
  -- use("github/copilot.vim")
  use({
    "gbprod/yanky.nvim",
    requires = { "kkharji/sqlite.lua" },
    config = function()
      require("yanky").setup({
        ring = {
          storage = "sqlite",
        },
      })
    end,
  })
  use({
    "michaelb/sniprun",
    run = "bash ./install.sh",
    config = function()
      require("plugins.sniprun-config")
    end,
  })
  use("fladson/vim-kitty")
  use("baskerville/vim-sxhkdrc")
  use("stevearc/dressing.nvim")
  use({
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("plugins.indent-blankline-config")
    end,
  })
  use({
    "folke/tokyonight.nvim",
    config = function()
      require("plugins.tokyonight-config")
    end,
  })
  use({
    "nvim-treesitter/nvim-treesitter-refactor",
    requires = "nvim-treesitter/nvim-treesitter",
  })
  use({
    "SmiteshP/nvim-gps",
    requires = "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-gps").setup({})
    end,
  })
  use({
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
    config = function()
      require("plugins.lualine-config")
    end,
  })
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require("plugins.treesitter-config")
    end,
  })
  use("nvim-treesitter/nvim-treesitter-textobjects")
  use("nvim-treesitter/playground")
  use({
    "nvim-treesitter/nvim-treesitter-context",
    config = function()
      require("plugins.treesitter-context-config")
    end,
  })
  use("p00f/nvim-ts-rainbow")
  use({
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "folke/lua-dev.nvim",
  })
  use("jbyuki/one-small-step-for-vimkind")
  use({
    "rcarriga/nvim-dap-ui",
    requires = "mfussenegger/nvim-dap",
    config = function()
      require("plugins.dap-config")
    end,
  })
  use({
    "hrsh7th/nvim-cmp",
    requires = {
      "L3MON4D3/LuaSnip",
      "onsails/lspkind-nvim",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-emoji",
    },
    config = function()
      require("plugins.cmp-config")
    end,
  })
  use({
    "rafamadriz/friendly-snippets",
    config = function()
      require("luasnip/loaders/from_vscode").lazy_load()
    end,
  })
  use("saadparwaiz1/cmp_luasnip")
  use({
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  })
  use("tpope/vim-fugitive")
  use({
    "lewis6991/gitsigns.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("gitsigns").setup({
        keymaps = {
          noremap = true,
          ["n ]c"] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'" },
          ["n [c"] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'" },

          -- Text objects
          ["o ih"] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
          ["x ih"] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
        },
        current_line_blame = true,
        current_line_blame_formatter_opts = {
          relative_time = true,
        },
      })
    end,
  })
  use({
    "nvim-telescope/telescope.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("plugins.telescope-config")
    end,
  })
  use({
    "nvim-telescope/telescope-file-browser.nvim",
    requires = {
      "nvim-telescope/telescope.nvim",
    },
  })
  use("evanleck/vim-svelte")
  use("nvim-telescope/telescope-ui-select.nvim")
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
  use({
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  })
  use({
    "luukvbaal/stabilize.nvim",
    config = function()
      require("stabilize").setup()
    end,
  })
  use({
    "kyazdani42/nvim-tree.lua",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("plugins.tree-config")
    end,
  })
  use({
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup({})
    end,
  })
  use({
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup({})
    end,
  })
  use({
    "folke/which-key.nvim",
    config = function()
      require("plugins.which-key-config")
    end,
  })
  use({
    "TimUntersberger/neogit",
    requires = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
    },
    config = function()
      require("plugins.neogit-config")
    end,
  })
  use({
    "jose-elias-alvarez/null-ls.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("plugins.null-ls-config")
    end,
  })
end)
