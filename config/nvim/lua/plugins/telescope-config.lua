local telescope = require("telescope")

telescope.setup({
  pickers = {
    buffers = {
      previewer = false,
    },
  },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_cursor(),
    },
  },
})

telescope.load_extension("fzf")
telescope.load_extension("ui-select")
