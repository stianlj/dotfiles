return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
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
      animate = {
        duration = {
          step = 10,
        },
      },
    },
    input = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    words = { enabled = true },
    picker = {
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
    }
  end,
}
