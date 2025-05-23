---@type vim.lsp.Config
---@requires emmet_language_server
return {
  cmd = { "emmet-language-server", "--stdio" },
  filetypes = {
    "css",
    "eruby",
    "html",
    "htmldjango",
    "javascriptreact",
    "less",
    "pug",
    "sass",
    "scss",
    "typescriptreact",
    "htmlangular",
    "svelte",
  },
  root_markers = { ".git" },
}
