local telescope = require("telescope")

telescope.setup({
  pickers = {
    buffers = {
      previewer = false,
    },
    find_files = {
      find_command = { "rg", "--files", "--iglob", "!.git", "--hidden" },
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
