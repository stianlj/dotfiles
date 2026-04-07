return {
  "folke/which-key.nvim",
  dependencies = {
    "echasnovski/mini.icons",
  },
  config = function()
    local wk = require("which-key")

    wk.add({
      {
        { "<leader>b",   group = "Buffers" },
        { "<leader>bd",  "<cmd>bd!<CR>",                                        desc = "Kill buffer" },

        { "<leader>c",   group = "Code" },
        { "<leader>cD",  "<cmd>Lspsaga show_line_diagnostics<CR>",              desc = "Show line diagnostics" },
        { "<leader>ca",  "<cmd>Lspsaga code_action<CR>",                        desc = "Code actions" },
        { "<leader>cd",  "<cmd>Lspsaga goto_definition<CR>",                    desc = "Go to definition" },
        { "<leader>cf",  "<cmd>Lspsaga lsp_finder<CR>",                         desc = "LSP Finder" },
        { "<leader>ch",  "<cmd>Lspsaga hover_doc<CR>",                          desc = "Documentaion" },

        { "<leader>cl",  group = "LSP" },
        { "<leader>clr", "<cmd>Lspsaga rename ++project<CR>",                   desc = "Rename" },
        { "<leader>cn",  desc = "Next usage" },
        { "<leader>cp",  desc = "Previous usage" },
        { "<leader>cr",  desc = "Rename" },

        { "<leader>d",   group = "DAP (debug)" },
        { "<leader>db",  "<cmd>lua require'dap'.toggle_breakpoint()<CR>",       desc = "Toggle breakpoint" },
        { "<leader>dc",  '<cmd>lua require("dap").continue()<CR>',              desc = "Continue" },
        { "<leader>di",  '<cmd>lua require("dap").step_into()<CR>',             desc = "Step into" },
        { "<leader>dn",  '<cmd>lua require("osv").launch({port = 8086})<CR>',   desc = "Run Neovim debugger" },
        { "<leader>do",  '<cmd>lua require("dap").step_over()<CR>',             desc = "Step over" },
        { "<leader>du",  '<cmd>lua require("dapui").toggle()<CR>',              desc = "Toggle DAP-UI" },
        { "<leader>f",   "<cmd>SnipRun<CR>",                                    desc = "Run snippet" },

        { "<leader>g",   group = "Git" },
        { "<leader>gF",  "<cmd>Git pull<CR>",                                   desc = "Pull" },
        { "<leader>gP",  "<cmd>Git push<CR>",                                   desc = "Push" },
        { "<leader>gR",  '<cmd>lua require"gitsigns".reset_buffer()<CR>',       desc = "Reset buffer" },
        { "<leader>gS",  '<cmd>lua require"gitsigns".stage_buffer()<CR>',       desc = "Stage buffer" },
        { "<leader>gU",  '<cmd>lua require"gitsigns".reset_buffer_index()<CR>', desc = "Reset buffer index" },
        { "<leader>gc",  "<cmd>Git commit<CR>",                                 desc = "Commit" },
        { "<leader>gg",  "<cmd>Git<CR>",                                        desc = "Git status" },
        { "<leader>gp",  '<cmd>lua require"gitsigns".preview_hunk()<CR>',       desc = "Preview hunk" },
        { "<leader>gr",  '<cmd>lua require"gitsigns".reset_hunk()<CR>',         desc = "Reset hunk" },
        { "<leader>gs",  '<cmd>lua require"gitsigns".stage_hunk()<CR>',         desc = "Stage hunk" },
        { "<leader>gu",  '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',    desc = "Undo stage hunk" },

        { "<leader>o",   group = "Open" },
        { "<leader>op",  "<cmd>NvimTreeToggle<CR>",                             desc = "Project sidebar" },
        { "<leader>p",   "<Plug>(YankyRingHistory)",                            desc = "Yank ring history" },

        { "<leader>q",   group = "Session" },
        {
          "<leader>qd",
          '<cmd>lua require("persistence").stop()<CR>',
          desc = "Prevent current session from being saved on exit",
        },
        {
          "<leader>ql",
          '<cmd>lua require("persistence").load({ last = true })<CR>',
          desc = "Restore the last session",
        },
        {
          "<leader>qs",
          '<cmd>lua require("persistence").load()<CR>',
          desc = "Restore session for the current directory",
        },

        { "<leader>u", "<cmd>UndotreeToggle<CR>", desc = "Undotree" },
      },
    })

    wk.add({
      { "gm", '<cmd>lua require"treesj".toggle()<CR>', desc = "Split/join under cursor" },
    })

    -- Own register for visual mode keymaps, since some of the mappings is the same as in normal mode
    wk.add({
      mode = { "v" },
      { "<leader>ca", "<cmd>lua vim.lsp.buf.range_code_action()<CR>", desc = "Code actions (visual)" },
      { "<leader>f",  "<Plug>SnipRun<CR>",                            desc = "Run snippet" },
      { "<leader>g",  group = "Git" },
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

    wk.add({
      {
        mode = { "n", "n", "n", "n" },
        { "yac", desc = "around class" },
        { "yaf", desc = "around function" },
        { "yic", desc = "inner class" },
        { "yif", desc = "inner function" },
      },
    })
  end,
}
