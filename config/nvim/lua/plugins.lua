-- TODO
-- https://github.com/svermeulen/vim-subversive
-- https://github.com/svermeulen/vim-yoink
-- https://github.com/svermeulen/vim-cutlass

local cmd = vim.cmd
local packer = require("packer")

require("packer_compiled")

cmd([[
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
  use("tpope/vim-commentary")
  use("tpope/vim-surround")
  use("tpope/vim-repeat")
  use("tpope/vim-obsession")
  use("tpope/vim-eunuch")
  use("fladson/vim-kitty")
  use("baskerville/vim-sxhkdrc")
  use("lukas-reineke/indent-blankline.nvim")
  use({
    "folke/tokyonight.nvim",
    config = function()
      require("plugins/tokyonight-config")
    end,
  })
  use({
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
    config = function()
      require("plugins/lualine-config")
    end,
  })
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require("plugins/treesitter-config")
    end,
  })
  use("nvim-treesitter/playground")
  use("p00f/nvim-ts-rainbow")
  use({
    "neovim/nvim-lspconfig",
    "williamboman/nvim-lsp-installer",
    "tami5/lspsaga.nvim",
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
    },
    config = function()
      require("plugins/cmp-config")
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
      require("telescope").load_extension("fzf")
    end,
  })
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
  use({
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  })
  use({
    "kyazdani42/nvim-tree.lua",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("nvim-tree").setup({})
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
      require("which-key").setup({})
    end,
  })
  use({
    "mhartington/formatter.nvim",
    config = function()
      require("plugins/formatter-config")
    end,
  })
end)
