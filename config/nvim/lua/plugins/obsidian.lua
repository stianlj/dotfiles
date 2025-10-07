return {
  "obsidian-nvim/obsidian.nvim",
  version = "*",
  cmd = "Obsidian",
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
        path = os.getenv("OBSIDIAN_VAULT_DIR"),
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
    checkbox = { order = { " ", ">", "x", "-" } },
  },
  keys = {
    { "<leader>xn", "<cmd>Obsidian new<cr>", desc = "Create a new note" },
    { "<leader>xl", "<cmd>Obsidian search<cr>", desc = "Search notes" },
    { "<leader>xl", "<cmd>Obsidian quick_switch<cr>", desc = "Find a note" },
    { "<leader>xd", "<cmd>Obsidian today<cr>", desc = "Show todays daily" },
    {
      "<leader>xtd",
      function()
        require("obsidian.api").set_checkbox("x")
      end,
      desc = "Toggle done checkbox",
    },
    {
      "<leader>xtp",
      function()
        require("obsidian.api").set_checkbox(">")
      end,
      desc = "Toggle in progress checkbox",
    },
    {
      "<leader>xtc",
      function()
        require("obsidian.api").set_checkbox("-")
      end,
      desc = "Toggle cancelled checkbox",
    },
  },
}
