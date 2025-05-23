---@type vim.lsp.Config
---@requires svelte-language-server
return {
  cmd = { "svelteserver", "--stdio" },
  filetypes = { "svelte" },
  root_markers = { "package.json", ".git" },
}
