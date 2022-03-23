local null_ls = require("null-ls")

null_ls.setup({
  on_attach = function(client)
    if client.resolved_capabilities.document_formatting then
      vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
    end
  end,
  sources = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.prettierd.with({
      filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "css",
        "scss",
        "less",
        "html",
        "json",
        "jsonc",
        "yaml",
        "markdown",
        "graphql",
        "svelte",
        "vue",
      },
    }),
    null_ls.builtins.formatting.trim_newlines,
    null_ls.builtins.formatting.yapf,
    null_ls.builtins.formatting.isort,
    null_ls.builtins.formatting.trim_whitespace,
    null_ls.builtins.formatting.shfmt.with({
      extra_args = { "-i", "2", "-ci" },
    }),
    null_ls.builtins.formatting.shellharden,
    null_ls.builtins.code_actions.gitsigns,
  },
})
