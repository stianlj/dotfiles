return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "isort", "black" },
      javascript = { "prettierd" },
      svelte = { "prettierd" },
      typescript = { "prettierd" },
      typescriptreact = { "prettierd" },
      http = { "kulala" },
      sh = { "shellharden", "shfmt" },
      ["_"] = { "trim_whitespace", "trim_newlines" },
    },
    format_on_save = { timeout_ms = 500, lsp_fallback = true },
    formatters = {
      shfmt = {
        prepend_args = { "-i", "2", "-ci" },
      },
      kulala = {
        command = "kulala-fmt",
        args = { "format", "$FILENAME" },
        stdin = false,
      },
    },
  },
}
