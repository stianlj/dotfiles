return {
  {
    "neovim/nvim-lspconfig",
    cmds = { "LspCopilotSignIn" },
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "ansible-language-server",
        "ansible-lint",
        "bash-language-server",
        -- "copilot-language-server",
        "docker-compose-language-service",
        "emmet-language-server",
        "emmet-ls",
        "eslint-lsp",
        "json-lsp",
        "kulala-fmt",
        "lua-language-server",
        "svelte-language-server",
        "vtsls",
        "prettierd",
        "woke",
        "write-good",
        "yaml-language-server",
        "yamllint",
      },
    },
  },
}
