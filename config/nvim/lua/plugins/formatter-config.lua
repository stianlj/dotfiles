vim.api.nvim_exec(
  [[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.lua,*.js,*.mjs,*.ts,*.tsx,*.yaml,*.yml FormatWrite
augroup END
]],
  true
)

local prettierdConfig = {
  logging = false,
  function()
    return {
      exe = "prettierd",
      args = { vim.api.nvim_buf_get_name(0) },
      stdin = true,
    }
  end,
}

require("formatter").setup({
  filetype = {
    javascript = prettierdConfig,
    typescript = prettierdConfig,
    typescriptreact = prettierdConfig,
    yaml = prettierdConfig,
    lua = {
      function()
        return {
          exe = "stylua",
          args = { "--search-parent-directories -" },
          stdin = true,
        }
      end,
    },
    sh = {
      function()
        return {
          exe = "shfmt",
          args = { "-i", 2 },
          stdin = true,
        }
      end,
    },
  },
})
