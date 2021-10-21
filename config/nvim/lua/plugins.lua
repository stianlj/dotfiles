return require('packer').startup(function()
	use 'wbthomason/packer.nvim'
	use {
		'navarasu/onedark.nvim',
		config = function()
			vim.g.onedark_style = 'deep'
			vim.g.onedark_transparent_background = true
			require('onedark').setup()
		end
	}
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
		config = function()
			require('nvim-treesitter').setup {
				highlight = {
					enable = true
				}
			}
		end
	}
end)
