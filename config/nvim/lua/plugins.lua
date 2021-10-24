-- TODO
-- * Prettier and other good formatting
-- * Telescope and file things
-- * Git, GitSigns and NeoGit
-- Some inspirations for now:
-- + https://github.com/nvim-treesitter/nvim-treesitter/wiki/Extra-modules-and-plugins
-- + https://github.com/nicknisi/dotfiles/blob/master/config/nvim/lua/plugins/treesitter.lua

local cmd = vim.cmd

cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use 'tpope/vim-commentary'
  use 'tpope/vim-surround'
  use 'lukas-reineke/indent-blankline.nvim'
  use {
    'marko-cerovac/material.nvim',
    config = function() require('plugins/material') end
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
    config = function()
      require('lualine').setup({
        options = {
          theme = 'material-nvim'
        }
      })
    end
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function() require('plugins/treesitter') end
  }
  use 'nvim-treesitter/playground'
  use 'p00f/nvim-ts-rainbow'
  use {
    'neovim/nvim-lspconfig',
    'williamboman/nvim-lsp-installer',
    config = function() require('plugins/lspconfig') end
  }
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'L3MON4D3/LuaSnip',
      'onsails/lspkind-nvim',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-path'
    },
    config = function() require('plugins/cmp') end
  }
  use 'saadparwaiz1/cmp_luasnip'
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function()
      require('gitsigns').setup({
        current_line_blame = true,
        current_line_blame_formatter_opts = {
          relative_time = true,
        }
      })
    end
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }
end)
