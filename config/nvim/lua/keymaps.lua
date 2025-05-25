local map = vim.api.nvim_set_keymap
local keymap = vim.keymap.set
local default_opts = { noremap = true, silent = true }
local whichKey = require("which-key")

-- TODO: use `vim.keymap.set` instead of `vim.api.nvim_set_keymap`
-- TODO: https://github.com/neovim/neovim/commit/6d41f65aa45f10a93ad476db01413abaac21f27d

whichKey.add({
  {
    { "<leader>b", group = "Buffers" },
    { "<leader>bd", "<cmd>bd!<CR>", desc = "Kill buffer" },

    { "<leader>c", group = "Code" },
    { "<leader>cD", "<cmd>Lspsaga show_line_diagnostics<CR>", desc = "Show line diagnostics" },
    { "<leader>ca", "<cmd>Lspsaga code_action<CR>", desc = "Code actions" },
    { "<leader>cd", "<cmd>Lspsaga goto_definition<CR>", desc = "Go to definition" },
    { "<leader>cf", "<cmd>Lspsaga lsp_finder<CR>", desc = "LSP Finder" },
    { "<leader>ch", "<cmd>Lspsaga hover_doc<CR>", desc = "Documentaion" },

    { "<leader>cl", group = "LSP" },
    { "<leader>clr", "<cmd>Lspsaga rename ++project<CR>", desc = "Rename" },
    { "<leader>cn", desc = "Next usage" },
    { "<leader>cp", desc = "Previous usage" },
    { "<leader>cr", desc = "Rename" },

    { "<leader>d", group = "DAP (debug)" },
    { "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", desc = "Toggle breakpoint" },
    { "<leader>dc", '<cmd>lua require("dap").continue()<CR>', desc = "Continue" },
    { "<leader>di", '<cmd>lua require("dap").step_into()<CR>', desc = "Step into" },
    { "<leader>dn", '<cmd>lua require("osv").launch({port = 8086})<CR>', desc = "Run Neovim debugger" },
    { "<leader>do", '<cmd>lua require("dap").step_over()<CR>', desc = "Step over" },
    { "<leader>du", '<cmd>lua require("dapui").toggle()<CR>', desc = "Toggle DAP-UI" },
    { "<leader>f", "<cmd>SnipRun<CR>", desc = "Run snippet" },

    { "<leader>g", group = "Git" },
    { "<leader>gF", "<cmd>Git pull<CR>", desc = "Pull" },
    { "<leader>gP", "<cmd>Git push<CR>", desc = "Push" },
    { "<leader>gR", '<cmd>lua require"gitsigns".reset_buffer()<CR>', desc = "Reset buffer" },
    { "<leader>gS", '<cmd>lua require"gitsigns".stage_buffer()<CR>', desc = "Stage buffer" },
    { "<leader>gU", '<cmd>lua require"gitsigns".reset_buffer_index()<CR>', desc = "Reset buffer index" },
    { "<leader>gc", "<cmd>Git commit<CR>", desc = "Commit" },
    { "<leader>gg", "<cmd>Git<CR>", desc = "Git status" },
    { "<leader>gp", '<cmd>lua require"gitsigns".preview_hunk()<CR>', desc = "Preview hunk" },
    { "<leader>gr", '<cmd>lua require"gitsigns".reset_hunk()<CR>', desc = "Reset hunk" },
    { "<leader>gs", '<cmd>lua require"gitsigns".stage_hunk()<CR>', desc = "Stage hunk" },
    { "<leader>gu", '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>', desc = "Undo stage hunk" },

    { "<leader>o", group = "Open" },
    { "<leader>op", "<cmd>NvimTreeToggle<CR>", desc = "Project sidebar" },
    { "<leader>p", "<Plug>(YankyRingHistory)", desc = "Yank ring history" },

    { "<leader>q", group = "Session" },
    {
      "<leader>qd",
      '<cmd>lua require("persistence").stop()<CR>',
      desc = "Prevent current session from being saved on exit",
    },
    { "<leader>ql", '<cmd>lua require("persistence").load({ last = true })<CR>', desc = "Restore the last session" },
    { "<leader>qs", '<cmd>lua require("persistence").load()<CR>', desc = "Restore session for the current directory" },

    { "<leader>u", "<cmd>UndotreeToggle<CR>", desc = "Undotree" },
  },
})

whichKey.add({
  { "gm", '<cmd>lua require"treesj".toggle()<CR>', desc = "Split/join under cursor" },
})

-- Own register for visual mode keymaps, since some of the mappings is the same as in normal mode
whichKey.add({
  mode = { "v" },
  { "<leader>ca", "<cmd>lua vim.lsp.buf.range_code_action()<CR>", desc = "Code actions (visual)" },
  { "<leader>f", "<Plug>SnipRun<CR>", desc = "Run snippet" },
  { "<leader>g", group = "Git" },
  {
    "<leader>gr",
    '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
    desc = "Reset hunk (visual)",
  },
  {
    "<leader>gs",
    '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
    desc = "Stage hunk (visual)",
  },
})

whichKey.add({
  {
    mode = { "n", "n", "n", "n" },
    { "yac", desc = "around class" },
    { "yaf", desc = "around function" },
    { "yic", desc = "inner class" },
    { "yif", desc = "inner function" },
  },
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

-- harpoon
keymap("n", "<M-m>", require("harpoon.mark").add_file)
keymap("n", "<M-h>", require("harpoon.ui").toggle_quick_menu)
keymap("n", "<M-Tab>", require("harpoon.ui").nav_next)
keymap("n", "<M-S-Tab>", require("harpoon.ui").nav_prev)

map("v", "<leader>y", '"+y', default_opts)

map("n", "n", "nzzzv", default_opts)
map("n", "N", "Nzzzv", default_opts)

-- Cycle through selection fields in snippets
map("s", "<Tab>", "<cmd>lua require('luasnip').jump(1)<CR>", default_opts)
map("s", "<S-Tab>", "<cmd>lua require('luasnip').jump(-1)<CR>", default_opts)
map("i", "<Tab>", "<cmd>lua require('luasnip').jump(1)<CR>", { noremap = false, silent = true })
map("i", "<S-Tab>", "<cmd>lua require('luasnip').jump(-1)<CR>", default_opts)

-- Allow for more emaces-like buffer close (because I'm too used to magit)
map("n", "<C-c><C-c>", ":x<CR>", default_opts)
