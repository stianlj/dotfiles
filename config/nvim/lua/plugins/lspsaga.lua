return {
  "nvimdev/lspsaga.nvim",
  event = "BufRead",
  opts = {
    lightbulb = {
      enable = false,
    },
    code_action = {
      num_shortcut = false,
    },
    symbol_in_winbar = {
      enable = false,
    },
  },
  dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
