local function parrot_status()
  local status_info = require("parrot.config").get_status_info()
  return string.format("AI: %s", status_info.model)
end

require("lualine").setup({
  options = {
    theme = "catppuccin",
    section_separators = { left = "", right = "" },
    component_separators = {},
    globalstatus = true,
  },
  sections = {
    lualine_b = { "branch", "diff", "diagnostics", parrot_status },
  },
})
