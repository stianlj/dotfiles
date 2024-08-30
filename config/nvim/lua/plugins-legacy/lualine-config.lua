local function parrot_status()
  local status_info = require("parrot.config").get_status_info()
  local status = ""
  if status_info.is_chat then
    status = status_info.prov.chat.name
  else
    status = status_info.prov.command.name
  end
  return string.format("AI: %s(%s)", status, status_info.model)
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
