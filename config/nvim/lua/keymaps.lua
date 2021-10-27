local map = vim.api.nvim_set_keymap
local default_opts = {noremap = true, silent = true}
local whichKey = require('which-key')

whichKey.register({
  ['<Space>'] = { '<cmd>Telescope find_files<CR>', 'Find file' },
  ['.'] = { '<cmd>Telescope file_browser<CR>', 'Open filebrowser' },
  ['/'] = { '<cmd>Telescope live_grep<CR>', 'Search in files' },
  s = { ':w<CR>', 'Save buffer' },
  b = {
    name = 'Buffers',
    b = { '<cmd>Telescope buffers<CR>', 'Switch buffers' },
    d = { '<cmd>bd!<CR>', 'Kill buffer' },
  },
  c = {
    name = 'Code',
    r = { '<cmd>lua vim.lsp.buf.rename()<CR>', 'LSP rename' },
    x = { '<cmd>TroubleToggle<CR>', 'LSP project diagnostics' }
  },
  g = {
    name = 'Git',
    -- Since NeoGit doesn't seem to cut it just yet
    g = { '<cmd>term emacsclient -nw -e "(magit-status)"<CR>', 'Magit status' },
    s = { '<cmd>Telescope git_status<CR>', 'Git status' },
  },
  o = {
    name = 'Open',
    p = { '<cmd>NvimTreeToggle<CR>', 'Project sidebar' },
  },
}, { prefix = '<leader>' })

-- don't use arrow keys
map('', '<up>', '<nop>', {noremap = true})
map('', '<down>', '<nop>', {noremap = true})
map('', '<left>', '<nop>', {noremap = true})
map('', '<right>', '<nop>', {noremap = true})

-- move around splits using Ctrl + {h,j,k,l}
map('n', '<C-h>', '<C-w>h', default_opts)
map('n', '<C-j>', '<C-w>j', default_opts)
map('n', '<C-k>', '<C-w>k', default_opts)
map('n', '<C-l>', '<C-w>l', default_opts)

-- A poor mans meta-x in Vim
map('n', '<M-x>', '<cmd>Telescope commands<CR>', default_opts)

map('n', '<leader>xw', '<cmd>TroubleToggle lsp_workspace_diagnostics<CR>', default_opts)
map('n', '<leader>xd', '<cmd>TroubleToggle lsp_document_diagnostics<CR>', default_opts)
map('n', '<leader>xq', '<cmd>TroubleToggle quickfix<CR>', default_opts)
map('n', '<leader>xl', '<cmd>TroubleToggle loclist<CR>', default_opts)
map('n', 'gR', '<cmd>TroubleToggle lsp_references<CR>', default_opts)
