---@requires woke
---@requires write-good
---@requires yamllint
---@requires dclint (external)
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
      ["yaml.docker-compose"] = { "dclint", "yamllint" },
    }

    lint.linters.yamllint.args = {
      "--format",
      "parsable",
      "--config-data",
      "{extends: default, rules: {line-length: {max: 120, level: warning}}}",
      "-",
    }

    lint.linters.dclint = {
      cmd = "dclint",
      stdin = false,
      stream = "stdout",
      ignore_exitcode = true,
      args = { "--formatter", "codeclimate" },
      parser = function(output, _)
        local decoded = vim.json.decode(output)
        local diagnostics = {}

        local severities = {
          critical = vim.diagnostic.severity.ERROR,
          minor = vim.diagnostic.severity.WARN,
        }

        for _, msg in ipairs(decoded or {}) do
          table.insert(diagnostics, {
            lnum = msg.location.lines.begin - 1,
            col = 0,
            message = msg.description,
            source = "dclint",
            severity = severities[msg.severity],
          })
        end
        return diagnostics
      end,
    }

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
