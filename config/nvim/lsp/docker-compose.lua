---@type vim.lsp.Config
---@requires docker-compose-language-service
return {
  cmd = { "docker-compose-langserver", "--stdio" },
  root_markers = { "docker_compose*.yml", "docker-compose.yml", "compose.yaml" },
  filetypes = { "yaml.docker-compose" },
  single_file_support = true,
}
