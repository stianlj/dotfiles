-- TODO
-- * LSP things
-- * Prettier and other good formatting
-- * Telescope and file things
-- * Git, GitSigns and NeoGit
-- Some inspirations for now:
-- + https://github.com/nvim-treesitter/nvim-treesitter/wiki/Extra-modules-and-plugins
-- + https://github.com/nicknisi/dotfiles/blob/master/config/nvim/lua/plugins/treesitter.lua

vim.cmd([[
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
    config = function()
      local lsp_installer = require('nvim-lsp-installer')
      lsp_installer.on_server_ready(function(server)
        local opts = {}
        server:setup(opts)
        vim.cmd [[ do User LspAttachBuffers ]]
      end)
    end
  }
end)
