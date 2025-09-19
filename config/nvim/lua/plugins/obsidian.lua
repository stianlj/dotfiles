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
  },
}
