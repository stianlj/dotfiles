---@type vim.lsp.Config
---@requires ansible-language-server
---@requires ansible-lint
--- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/configs/ansiblels.lua
--- https://github.com/neovim/nvim-lspconfig/pull/3659/files#diff-5ecad9b03732db4dfd97f3aa9874fa465b88ee4e121bf152e670f46e4f19cc6e
return {
  cmd = { "ansible-language-server", "--stdio" },
  settings = {
    ansible = {
      python = {
        interpreterPath = "python",
      },
      ansible = {
        path = "ansible",
      },
      executionEnvironment = {
        enabled = false,
      },
      validation = {
        enabled = true,
        lint = {
          enabled = true,
          path = "ansible-lint",
        },
      },
    },
  },
  filetypes = { "yaml.ansible" },
  root_markers = { "ansible.cfg", ".ansible-lint" },
}
