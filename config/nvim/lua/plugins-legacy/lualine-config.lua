require("lualine").setup({
  options = {
    theme = "catppuccin",
    section_separators = { left = "", right = "" },
    component_separators = {},
    globalstatus = true,
  },
  sections = {
    lualine_b = { "branch", "diff", "diagnostics" },
  },
})
