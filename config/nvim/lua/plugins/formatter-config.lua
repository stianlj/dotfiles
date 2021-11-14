vim.api.nvim_exec(
  [[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.lua,*.js,*.mjs,*.yaml,*.yml FormatWrite
augroup END
]],
  true
)

require("formatter").setup({
  filetype = {
    lua = {
      function()
        return {
          exe = "stylua",
          args = { "--search-parent-directories -" },
          stdin = true,
        }
      end,
    },
    javascript = {
      logging = false,
      function()
        return {
          exe = "prettierd",
          args = { vim.api.nvim_buf_get_name(0) },
          stdin = true,
        }
      end,
    },
    yaml = {
      logging = false,
      function()
        return {
          exe = "prettierd",
          args = { vim.api.nvim_buf_get_name(0) },
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
