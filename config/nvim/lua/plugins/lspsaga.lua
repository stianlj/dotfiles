return {
  "glepnir/lspsaga.nvim",
  event = "BufRead",
  config = function()
    require("lspsaga").setup({
      lightbulb = {
        enable = false,
      },
    })
  end,
  dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
