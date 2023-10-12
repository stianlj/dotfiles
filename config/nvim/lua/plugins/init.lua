return {
  "dstein64/vim-startuptime",
  {
    "numToStr/Comment.nvim",
    config = function()
      require("plugins-legacy.comment-config")
    end,
  },
  {
    "akinsho/bufferline.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    version = "*",
    enabled = false,
    config = function()
      require("plugins-legacy.bufferline-config")
    end,
  },
  "wakatime/vim-wakatime",
  "tpope/vim-repeat",
  "tpope/vim-eunuch",
  "tpope/vim-sleuth",
  "elkowar/yuck.vim",
  "gpanders/nvim-parinfer",
  {
    "gbprod/yanky.nvim",
    dependencies = { "kkharji/sqlite.lua" },
    config = function()
      require("yanky").setup({
        ring = {
          storage = "sqlite",
        },
      })
    end,
  },
  --[[ { ]]
  --[[   "michaelb/snipbuild", ]]
  --[[   build = "bash ./install.sh", ]]
  --[[   config = function() ]]
  --[[     require("plugins-legacy.snipbuild-config") ]]
  --[[   end, ]]
  --[[ }, ]]
  "fladson/vim-kitty",
  "baskerville/vim-sxhkdrc",
  "theRealCarneiro/hyprland-vim-syntax",
  "stevearc/dressing.nvim",
  {
    "catppuccin/nvim",
    name = "catppuccin",
    build = ":CatppuccinCompile",
    config = function()
      require("plugins-legacy.catppuccin-config")
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
    config = function()
      require("plugins-legacy.lualine-config")
    end,
  },
  --[[ { ]]
  --[[   "williamboman/mason.nvim", ]]
  --[[   "williamboman/mason-lspconfig.nvim", ]]
  --[[   "neovim/nvim-lspconfig", ]]
  --[[   "folke/neodev.nvim", ]]
  --[[ }, ]]
  "jbyuki/one-small-step-for-vimkind",
  {
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      require("plugins-legacy.dap-config")
    end,
  },
  --[[ { ]]
  --[[   "hrsh7th/nvim-cmp", ]]
  --[[   dependencies = { ]]
  --[[     "L3MON4D3/LuaSnip", ]]
  --[[     "onsails/lspkind-nvim", ]]
  --[[     "hrsh7th/cmp-buffer", ]]
  --[[     "hrsh7th/cmp-nvim-lsp", ]]
  --[[     "hrsh7th/cmp-nvim-lua", ]]
  --[[     "hrsh7th/cmp-path", ]]
  --[[     "hrsh7th/cmp-emoji", ]]
  --[[   }, ]]
  --[[   config = function() ]]
  --[[     require("plugins-legacy.cmp-config") ]]
  --[[   end, ]]
  --[[ }, ]]
  {
    "rafamadriz/friendly-snippets",
    config = function()
      require("luasnip/loaders/from_vscode").lazy_load()
    end,
  },
  --[[ "saadparwaiz1/cmp_luasnip", ]]
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },
  "tpope/vim-fugitive",
  {
    "lewis6991/gitsigns.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("gitsigns").setup({
        current_line_blame = true,
        current_line_blame_formatter_opts = {
          relative_time = true,
        },
      })
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("plugins-legacy.telescope-config")
    end,
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
  },
  "evanleck/vim-svelte",
  "b0o/schemastore.nvim",
  "nvim-telescope/telescope-ui-select.nvim",
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  },
  {
    "luukvbaal/stabilize.nvim",
    config = function()
      require("stabilize").setup()
    end,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    opts = {
      signs = false,
    },
  },
  {
    "folke/which-key.nvim",
    config = function()
      require("plugins-legacy.which-key-config")
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("plugins-legacy.null-ls-config")
    end,
  },
}
