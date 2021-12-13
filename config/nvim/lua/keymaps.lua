local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
local whichKey = require("which-key")

whichKey.register({
  ["<Space>"] = { "<cmd>Telescope find_files<CR>", "Find file" },
  ["."] = { "<cmd>Telescope file_browser<CR>", "Open filebrowser" },
  ["/"] = { "<cmd>Telescope live_grep<CR>", "Search in files" },
  s = { ":w<CR>", "Save buffer" },
  b = {
    name = "Buffers",
    b = { "<cmd>Telescope buffers<CR>", "Switch buffers" },
    d = { "<cmd>bd!<CR>", "Kill buffer" },
  },
  c = {
    name = "Code",
    d = { "<cmd>Telescope lsp_definitions<CR>", "LSP definitions" },
    R = { "<cmd>Telescope lsp_references<CR>", "LSP references" },
    i = { "<cmd>Telescope lsp_implementations<CR>", "LSP implementations" },
    D = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "LSP declarations" },
    a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "LSP code actions" },
    r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "LSP rename" },
    h = { "<cmd>lua vim.lsp.buf.hover()<CR>", "LSP hover doc" },
    x = { "<cmd>TroubleToggle<CR>", "LSP project diagnostics" },
  },
  g = {
    name = "Git",
    c = { "<cmd>Git commit<CR>", "Commit" },
    F = { "<cmd>Git pull<CR>", "Pull" },
    -- Since NeoGit doesn't seem to cut it just yet
    g = { "<cmd>!tmux neww -n magit 'emacsclient -nw -e \"(magit-status)\"'<CR>", "Magit status" },
    p = { '<cmd>lua require"gitsigns".preview_hunk()<CR>', "Preview hunk" },
    P = { "<cmd>Git push<CR>", "Push" },
    r = { '<cmd>lua require"gitsigns".reset_hunk()<CR>', "Reset hunk" },
    R = { '<cmd>lua require"gitsigns".reset_buffer()<CR>', "Reset buffer" },
    s = { '<cmd>lua require"gitsigns".stage_hunk()<CR>', "Stage hunk" },
    S = { '<cmd>lua require"gitsigns".stage_buffer()<CR>', "Stage buffer" },
    u = { '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>', "Undo stage hunk" },
    U = { '<cmd>lua require"gitsigns".reset_buffer_index()<CR>', "Reset buffer index" },
  },
  o = {
    name = "Open",
    p = { "<cmd>NvimTreeToggle<CR>", "Project sidebar" },
  },
}, {
  prefix = "<leader>",
})

-- Own register for visual mode keymaps, since some of the mappings is the same as in normal mode
whichKey.register({
  c = {
    a = { "<cmd>lua vim.lsp.buf.range_code_action()<CR>", "LSP code actions (visual)" },
  },
  g = {
    name = "Git",
    s = { '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>', "Stage hunk (visual)" },
    r = { '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>', "Reset hunk (visual)" },
  },
}, {
  prefix = "<leader>",
  mode = "v",
})

-- Register for mappings from other plugins that just need explaining
local textObjects = {
  i = {
    f = "inner function",
    c = "inner class",
  },
  a = {
    f = "around function",
    c = "around class",
  },
}

whichKey.register({
  c = textObjects,
  y = textObjects,
  v = textObjects,
  d = textObjects,
})

-- don't use arrow keys
map("", "<up>", "<nop>", { noremap = true })
map("", "<down>", "<nop>", { noremap = true })
map("", "<left>", "<nop>", { noremap = true })
map("", "<right>", "<nop>", { noremap = true })

-- move around splits using Ctrl + {h,j,k,l}
map("n", "<C-h>", "<C-w>h", default_opts)
map("n", "<C-j>", "<C-w>j", default_opts)
map("n", "<C-k>", "<C-w>k", default_opts)
map("n", "<C-l>", "<C-w>l", default_opts)

map("n", "<M-j>", ":m .+1<CR>==", default_opts)
map("n", "<M-k>", ":m .-2<CR>==", default_opts)
map("v", "<M-j>", ":m '>+1<CR>gv=gv", default_opts)
map("v", "<M-k>", ":m '<-2<CR>gv=gv", default_opts)

map("v", "<leader>y", '"+y', default_opts)

map("n", "n", "nzzzv", default_opts)
map("n", "N", "Nzzzv", default_opts)

-- Cycle through selection fields in snippets
map("s", "<Tab>", "<cmd>lua require('luasnip').jump(1)<CR>", default_opts)
map("s", "<S-Tab>", "<cmd>lua require('luasnip').jump(-1)<CR>", default_opts)
map("i", "<Tab>", "<cmd>lua require('luasnip').jump(1)<CR>", { noremap = false, silent = true })
map("i", "<S-Tab>", "<cmd>lua require('luasnip').jump(-1)<CR>", default_opts)

-- A poor mans meta-x in Vim
map("n", "<M-x>", "<cmd>Telescope commands<CR>", default_opts)

map("n", "<leader>xw", "<cmd>TroubleToggle lsp_workspace_diagnostics<CR>", default_opts)
map("n", "<leader>xd", "<cmd>TroubleToggle lsp_document_diagnostics<CR>", default_opts)
map("n", "<leader>xq", "<cmd>TroubleToggle quickfix<CR>", default_opts)
map("n", "<leader>xl", "<cmd>TroubleToggle loclist<CR>", default_opts)
map("n", "gR", "<cmd>TroubleToggle lsp_references<CR>", default_opts)
