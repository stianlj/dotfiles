return {
  "dstein64/vim-startuptime",
  "wakatime/vim-wakatime",
  "tpope/vim-repeat",
  "tpope/vim-eunuch",
  "tpope/vim-sleuth",
  "AndrewRadev/switch.vim",
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
  "fladson/vim-kitty",
  "baskerville/vim-sxhkdrc",
  "theRealCarneiro/hyprland-vim-syntax",
  "pearofducks/ansible-vim",
  "stevearc/dressing.nvim",
  "jbyuki/one-small-step-for-vimkind",
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    config = function()
      require("plugins-legacy.dap-config")
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },
  "tpope/vim-fugitive",
  "idanarye/vim-merginal",
  "tpope/vim-rhubarb",
  {
    "lewis6991/gitsigns.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("gitsigns").setup({
        current_line_blame = true,
        current_line_blame_formatter = " <author>, <author_time:%R> - <summary>",
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
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    opts = {
      signs = false,
    },
  },
}
