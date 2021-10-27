vim.api.nvim_exec(
  [[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.lua FormatWrite
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
  },
})
