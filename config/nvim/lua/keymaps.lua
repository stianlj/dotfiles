local map = vim.api.nvim_set_keymap
local default_opts = {noremap = true, silent = true}
local cmd = vim.cmd

-- don't use arrow keys
map('', '<up>', '<nop>', {noremap = true})
map('', '<down>', '<nop>', {noremap = true})
map('', '<left>', '<nop>', {noremap = true})
map('', '<right>', '<nop>', {noremap = true})

-- fast saving with <leader> and s
map('n', '<leader>s', ':w<CR>', default_opts)
map('i', '<leader>s', '<C-c>:w<CR>', default_opts)

-- move around splits using Ctrl + {h,j,k,l}
map('n', '<C-h>', '<C-w>h', default_opts)
map('n', '<C-j>', '<C-w>j', default_opts)
map('n', '<C-k>', '<C-w>k', default_opts)
map('n', '<C-l>', '<C-w>l', default_opts)

map('n', '<leader><Space>', '<cmd>Telescope find_files<CR>', default_opts)
map('n', '<leader>bb', '<cmd>Telescope buffers<CR>', default_opts)
map('n', '<leader>gs', '<cmd>Telescope git_status<CR>', default_opts)
map('n', '<leader>/', '<cmd>Telescope live_grep<CR>', default_opts)

map('n', '<leader>op', '<cmd>NvimTreeToggle<CR>', default_opts)
