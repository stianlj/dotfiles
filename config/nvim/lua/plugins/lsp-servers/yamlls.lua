local M = {}

M.settings = {
  yaml = {
    validate = true,
    schemas = {
      ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
      ["kubernetes"] = "/.kubernetes/*.yaml",
    },
  },
}

return M
