local gps = require("nvim-gps")

require("lualine").setup({
  options = {
    theme = "tokyonight",
    section_separators = { left = "", right = "" },
    component_separators = {},
    globalstatus = true,
  },
  sections = {
    lualine_c = {
      { gps.get_location, cond = gps.is_available },
    },
  },
})
