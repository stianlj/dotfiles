local map = vim.api.nvim_set_keymap
local keymap = vim.keymap.set
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
    f = { "<cmd>Lspsaga lsp_finder<CR>", "LSP Finder" },
    d = { "<cmd>Lspsaga goto_definition<CR>", "Go to definition" },
    D = { "<cmd>Lspsaga show_line_diagnostics<CR>", "Show line diagnostics" },
    a = { "<cmd>Lspsaga code_action<CR>", "Code actions" },
    l = {
      name = "LSP",
      r = { "<cmd>Lspsaga rename ++project<CR>", "Rename" },
    },
    r = "Rename",
    n = "Next usage",
    p = "Previous usage",
    h = { "<cmd>Lspsaga hover_doc<CR>", "Documentaion" },
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
    g = { "<cmd>Git<CR>", "Git status" },
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

whichKey.register({
  g = {
    m = { '<cmd>lua require"treesj".toggle()<CR>', "Split/join under cursor" },
  },
}, {
  mode = "n",
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

keymap({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
keymap({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
keymap({ "n", "x" }, "y", "<Plug>(YankyYank)")
keymap({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
keymap({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")
keymap("n", "<c-n>", "<Plug>(YankyCycleForward)")
keymap("n", "<c-p>", "<Plug>(YankyCycleBackward)")

keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>")

-- don't use arrow keys
map("", "<up>", "<nop>", { noremap = true })
map("", "<down>", "<nop>", { noremap = true })
map("", "<left>", "<nop>", { noremap = true })
map("", "<right>", "<nop>", { noremap = true })

keymap("n", "<M-S-h>", require("smart-splits").resize_left)
keymap("n", "<M-S-j>", require("smart-splits").resize_down)
keymap("n", "<M-S-k>", require("smart-splits").resize_up)
keymap("n", "<M-S-l>", require("smart-splits").resize_right)

keymap("n", "<C-h>", require("smart-splits").move_cursor_left)
keymap("n", "<C-j>", require("smart-splits").move_cursor_down)
keymap("n", "<C-k>", require("smart-splits").move_cursor_up)
keymap("n", "<C-l>", require("smart-splits").move_cursor_right)

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
