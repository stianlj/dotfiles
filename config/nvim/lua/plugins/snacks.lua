return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    lazygit = { configure = true },
    indent = {
      enabled = true,
      hl = {
        "SnacksIndent1",
        "SnacksIndent2",
        "SnacksIndent3",
        "SnacksIndent4",
        "SnacksIndent5",
        "SnacksIndent6",
        "SnacksIndent7",
        "SnacksIndent8",
      },
      animate = { enabled = false },
    },
    gh = {},
    input = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    words = { enabled = true },
    picker = {
      sources = {
        gh_issue = {},
        gh_pr = {},
      },
      matcher = {
        frecency = true,
        history_bonus = true,
      },
      layout = {
        preset = "ivy",
      },
      debug = {
        scores = true,
      },
    },
  },
  keys = function()
    local Snacks = require("snacks")
    return {
      {
        "<leader>cs",
        function()
          Snacks.scratch()
        end,
        desc = "Open a scratch buffer",
      },
      {
        "<leader>cS",
        function()
          Snacks.scratch.select()
        end,
        desc = "Select a scratch buffer",
      },
      {
        "<leader><space>",
        function()
          Snacks.picker.files()
        end,
        desc = "Smart Find Files",
      },
      {
        "<leader>bb",
        function()
          Snacks.picker.buffers()
        end,
        desc = "Buffers",
      },
      {
        "<leader>/",
        function()
          Snacks.picker.grep()
        end,
        desc = "Grep",
      },
      {
        "<leader>.",
        function()
          Snacks.explorer()
        end,
        desc = "File Explorer",
      },
      {
        "<M-x>",
        function()
          Snacks.picker.commands()
        end,
        desc = "Commands",
      },
      {
        "<leader>gb",
        function()
          Snacks.picker.git_branches()
        end,
        desc = "List branches",
      },
      {
        "<leader>gf",
        function()
          Snacks.picker.git_log_file()
        end,
        desc = "List branches",
      },
      {
        "<leader>gL",
        function()
          Snacks.picker.git_log()
        end,
        desc = "List branches",
      },
      {
        "<leader>gl",
        function()
          Snacks.lazygit()
        end,
        desc = "Lazygit",
      },
      {
        "<leader>gi",
        function()
          Snacks.picker.gh_issue()
        end,
        desc = "GitHub Issues (open)",
      },
      {
        "<leader>gI",
        function()
          Snacks.picker.gh_issue({ state = "all" })
        end,
        desc = "GitHub Issues (all)",
      },
      {
        "<leader>gm",
        function()
          Snacks.picker.gh_pr()
        end,
        desc = "GitHub Pull Requests (open)",
      },
      {
        "<leader>gM",
        function()
          Snacks.picker.gh_pr({ state = "all" })
        end,
        desc = "GitHub Pull Requests (all)",
      },
    }
  end,
}
