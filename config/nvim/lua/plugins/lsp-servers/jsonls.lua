local M = {}

M.settings = {
  json = {
    schemas = {
      {
        fileMatch = { "package.json" },
        url = "https://json.schemastore.org/package.json",
      },
    },
  },
}

return M
