return {
  "obsidian-nvim/obsidian.nvim",
  version = "*",
  -- lazy = true,
  -- ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  ---@module 'obsidian'
  ---@type obsidian.config.ClientOpts
  opts = {
    legacy_commands = false,
    ui = { enable = false },
    workspaces = {
      {
        name = "personal",
        path = "~/Documents/Obsidian/Notes",
      },
    },
    daily_notes = {
      folder = "0. Dailies",
    },
    picker = {
      name = "snacks.pick",
    },
    completion = {
      nvim_cmp = false,
      blink = true,
    },
    -- checkbox = { order = { " ", ">", "x", "-" } },
    -- callbacks = {
    --   enter_note = function(_, note)
    --     vim.keymap.set("n", "<leader>ntd", function()
    --       require("obsidian.api").set_checkbox("x")
    --     end, {
    --       buffer = note.bufnr,
    --       desc = "Toggle done checkbox",
    --     })
    --   end,
    -- },
  },
  keys = {
    { "<leader>nn", "<cmd>Obsidian new<cr>", desc = "Create a new note" },
    { "<leader>ns", "<cmd>Obsidian search<cr>", desc = "Search notes" },
    { "<leader>nf", "<cmd>Obsidian quick_switch<cr>", desc = "Find a note" },
    { "<leader>nd", "<cmd>Obsidian today<cr>", desc = "Show todays daily" },
    -- {
    --   "<leader>ntd",
    --   function()
    --     require("obsidian.api").set_checkbox()
    --   end,
    --   desc = "Toggle done checkbox",
    -- },
    -- {
    --   "<leader>ntp",
    --   function()
    --     require("obsidian.api").set_checkbox(">")
    --   end,
    --   desc = "Toggle in progress checkbox",
    -- },
    -- {
    --   "<leader>ntc",
    --   function()
    --     require("obsidian.api").set_checkbox("-")
    --   end,
    --   desc = "Toggle cancelled checkbox",
    -- },
  },
}
