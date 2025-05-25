---@requires woke
---@requires write-good
---@requires yamllint
return {
  "mfussenegger/nvim-lint",
  event = { "BufWritePost", "BufReadPost", "InsertLeave" },
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      javascript = { "woke" },
      typescript = { "woke" },
      javascriptreact = { "woke" },
      typescriptreact = { "woke" },
      svelte = { "woke" },
      ansible = { "woke" },
      yaml = { "yamllint" },
    }

    lint.linters.yamllint.args = {
      "--format",
      "parsable",
      "--config-data",
      "{extends: default, rules: {line-length: {max: 120, level: warning}}}",
      "-",
    }

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
