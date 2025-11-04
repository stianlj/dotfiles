return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  init = function()
    vim.api.nvim_command("colorscheme tokyonight")
  end,
  opts = {
    style = "night",
    styles = {
      comments = { italic = true, bold = true },
    },
    dim_inactive = true,
    lualine_bold = true,
  },
}
