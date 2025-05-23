---@type vim.lsp.Config
---@requires kulala-ls
return {
  cmd = { "kulala-ls", "--stdio" },
  filetypes = { "http" },
  root_markers = { "git" },
}
