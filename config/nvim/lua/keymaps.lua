local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
local whichKey = require("which-key")

-- TODO: use `vim.keymap.set` instead of `vim.api.nvim_set_keymap`
-- TODO: https://github.com/neovim/neovim/commit/6d41f65aa45f10a93ad476db01413abaac21f27d

whichKey.register({
  ["<Space>"] = { "<cmd>Telescope find_files theme=ivy<CR>", "Find file" },
  ["."] = { "<cmd>Telescope file_browser theme=ivy<CR>", "Open filebrowser" },
  ["/"] = { "<cmd>Telescope live_grep theme=ivy<CR>", "Search in files" },
  s = { ":w<CR>", "Save buffer" },
  b = {
    name = "Buffers",
    b = { "<cmd>Telescope buffers theme=ivy<CR>", "Switch buffers" },
    d = { "<cmd>bd!<CR>", "Kill buffer" },
  },
  c = {
    name = "Code",
    d = { "<cmd>Telescope lsp_definitions theme=ivy<CR>", "Definitions" },
    R = { "<cmd>Telescope lsp_references theme=ivy<CR>", "References" },
    i = { "<cmd>Telescope lsp_implementations theme=ivy<CR>", "Implementations" },
    a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code actions" },
    D = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Declarations" },
    l = {
      name = "LSP",
      r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
    },
    r = "Rename",
    n = "Next usage",
    p = "Previous usage",
    h = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Documentaion" },
    x = { "<cmd>TroubleToggle<CR>", "Project diagnostics" },
  },
  d = {
    name = "DAP (debug)",
    b = { "<cmd>lua require'dap'.toggle_breakpoint()<CR>", "Toggle breakpoint" },
    u = { '<cmd>lua require("dapui").toggle()<CR>', "Toggle DAP-UI" },
    c = { '<cmd>lua require("dap").continue()<CR>', "Continue" },
    i = { '<cmd>lua require("dap").step_into()<CR>', "Step into" },
    o = { '<cmd>lua require("dap").step_over()<CR>', "Step over" },
    n = { '<cmd>lua require("osv").launch({port = 8086})<CR>', "Run Neovim debugger" },
  },
  g = {
    name = "Git",
    c = { "<cmd>Git commit<CR>", "Commit" },
    F = { "<cmd>Git pull<CR>", "Pull" },
    g = { "<cmd>Neogit<CR>", "Neogit status" },
    m = { "<cmd>!tmux neww -n magit 'emacsclient -nw -e \"(magit-status)\"'<CR>", "Magit status" },
    l = { "<cmd>!tmux neww -n lazygit 'lazygit'<CR>", "Lazygit status" },
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
  p = { "<Plug>(YankyRingHistory)", "Yank ring history" },
}, {
  prefix = "<leader>",
})

-- Own register for visual mode keymaps, since some of the mappings is the same as in normal mode
whichKey.register({
  c = {
    a = { "<cmd>lua vim.lsp.buf.range_code_action()<CR>", "Code actions (visual)" },
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

vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
vim.keymap.set({ "n", "x" }, "y", "<Plug>(YankyYank)")
vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")
vim.keymap.set("n", "<c-n>", "<Plug>(YankyCycleForward)")
vim.keymap.set("n", "<c-p>", "<Plug>(YankyCycleBackward)")

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

for i = 1, 9 do
  map("n", "<M-" .. i .. ">", "<cmd>BufferLineGoToBuffer " .. i .. "<CR>", default_opts)
end

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

-- Hop keys
map("n", "s", "<cmd>lua require('hop').hint_words()<CR>", default_opts)

-- Allow for more emaces-like buffer close (because I'm too used to magit)
map("n", "<C-c><C-c>", ":x<CR>", default_opts)

-- A poor mans meta-x in Vim
map("n", "<M-x>", "<cmd>Telescope commands theme=ivy<CR>", default_opts)

map("n", "<leader>xw", "<cmd>TroubleToggle lsp_workspace_diagnostics<CR>", default_opts)
map("n", "<leader>xd", "<cmd>TroubleToggle lsp_document_diagnostics<CR>", default_opts)
map("n", "<leader>xq", "<cmd>TroubleToggle quickfix<CR>", default_opts)
map("n", "<leader>xl", "<cmd>TroubleToggle loclist<CR>", default_opts)
map("n", "gR", "<cmd>TroubleToggle lsp_references<CR>", default_opts)
