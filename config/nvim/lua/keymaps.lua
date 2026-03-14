local map = vim.api.nvim_set_keymap
local keymap = vim.keymap.set
local default_opts = { noremap = true, silent = true }

-- TODO: use `vim.keymap.set` instead of `vim.api.nvim_set_keymap`
-- TODO: https://github.com/neovim/neovim/commit/6d41f65aa45f10a93ad476db01413abaac21f27d

keymap({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
keymap({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
keymap({ "n", "x" }, "y", "<Plug>(YankyYank)")
keymap({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
keymap({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")

keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>")

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
