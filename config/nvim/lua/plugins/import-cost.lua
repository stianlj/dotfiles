return {
  "barrett-ruth/import-cost.nvim",
  build = "sh install.sh npm",
  config = {
    filetypes = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptlang",
    },
    format = {
      virtual_text = " %s (gzipped: %s)",
    },
  },
}
