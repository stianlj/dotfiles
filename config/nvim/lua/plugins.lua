-- TODO
-- * LSP things
-- * Prettier and other good formatting
-- * Telescope and file things
-- * Git, GitSigns and NeoGit
-- * Tpope things. Like commentary and surround
-- Some inspirations for now:
-- + https://github.com/nvim-treesitter/nvim-treesitter/wiki/Extra-modules-and-plugins
-- + https://github.com/nicknisi/dotfiles/blob/master/config/nvim/lua/plugins/treesitter.lua

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

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
        require('nvim-treesitter.configs').setup {
          ensure_installed = "maintained",
          highlight = {
            enable = true,
            use_languagetree = true,
            additional_vim_regex_highlighting = true,
          },
          rainbow = {
            enable = true,
            extended_mode = true,
          },
          indent = {
            enable = true
          }, -- The following does not work, since a is already assigned. TODO
          textobjects = {
            select = {
              enable = true,
              lookahead = true, -- automatically jump forward to matching textobj
              keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner"
              }
            },
            swap = {
              enable = true,
              swap_next = {
                ["<leader>a"] = "@parameter.inner"
              },
              swap_previous = {
                ["<leader>A"] = "@parameter.inner"
              }
            }
          },
          playground = {
            enable = true,
            disable = {},
            updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
            persist_queries = false, -- Whether the query persists across vim sessions
            keybindings = {
              toggle_query_editor = 'o',
              toggle_hl_groups = 'i',
              toggle_injected_languages = 't',
              toggle_anonymous_nodes = 'a',
              toggle_language_display = 'I',
              focus_language = 'f',
              unfocus_language = 'F',
              update = 'R',
              goto_node = '<cr>',
              show_help = '?',
            },
          }
        }
      end
    }
    use 'nvim-treesitter/playground'
    use 'p00f/nvim-ts-rainbow'
end)
