require("bufferline").setup({
  options = {
    diagnostics = "nvim_lsp",
    offsets = { { filetype = "NvimTree", text = "File Explorer", text_align = "left" } },
    separator_style = "slant",
    numbers = function(opts)
      return string.format("%s·%s", opts.ordinal, opts.raise(opts.id))
    end,
  },
})
