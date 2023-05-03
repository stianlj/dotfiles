return {
  "glepnir/lspsaga.nvim",
  event = "BufRead",
  config = function()
    require("lspsaga").setup({
      lightbulb = {
        enable = false,
      },
      code_action = {
        num_shortcut = false,
      },
      symbol_in_winbar = {
        enable = false,
      },
    })
  end,
  dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
