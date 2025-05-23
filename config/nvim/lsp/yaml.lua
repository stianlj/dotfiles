---@type vim.lsp.Config
---@requires yaml-language-server
return {
  cmd = { "yaml-language-server", "--stdio" },
  filetypes = { "yaml", "yaml.gitlab" },
  settings = {
    yaml = {
      schemas = require("schemastore").yaml.schemas(),
      validate = true,
    },
  },
}
