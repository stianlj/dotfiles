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
  },
  keys = function()
    local snacks = require("snacks")
    return {
      {
        "<leader>cs",
        function()
          snacks.scratch()
        end,
        desc = "Open a scratch buffer",
      },
      {
        "<leader>cS",
        function()
          snacks.scratch.select()
        end,
        desc = "Select a scratch buffer",
      },
    }
  end,
}
