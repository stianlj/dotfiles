return {
  "MeanderingProgrammer/render-markdown.nvim",
  opts = {
    checkbox = {
      custom = {
        todo = {},
        in_progress = { raw = "[>]", rendered = "󰥔 ", highlight = "RenderMarkdownTodo", scope_highlight = nil },
        cancelled = { raw = "[-]", rendered = "󰱒 ", highlight = "RenderMarkdownWarn", scope_highlight = nil },
      },
    },
  },
  ft = { "markdown", "codecompanion" },
  dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" },
}
