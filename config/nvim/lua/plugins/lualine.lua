return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", opts = true },
  opts = {
    options = {
      theme = "catppuccin",
      section_separators = { left = "", right = "" },
      component_separators = {},
      globalstatus = true,
    },
    sections = {
      lualine_b = { "branch", "diff", "diagnostics" },
      lualine_c = {
        {
          function()
            return " "
          end,
          color = function()
            local status = require("sidekick.status").get()
            if status then
              return status.kind == "Error" and "DiagnosticError" or status.busy and "DiagnosticWarn" or "Special"
            end
          end,
          cond = function()
            local status = require("sidekick.status")
            return status.get() ~= nil
          end,
        },
      },
      lualine_x = {
        {
          function()
            local status = require("sidekick.status").cli()
            return "󰚩 " .. (#status > 1 and #status or "")
          end,
          cond = function()
            return #require("sidekick.status").cli() > 0
          end,
          color = function()
            return "Special"
          end,
        },
      },
    },
  },
}
