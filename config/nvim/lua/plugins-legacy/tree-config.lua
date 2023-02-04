require("nvim-tree").setup({
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
  update_focused_file = {
    enable = true,
  },
  filters = {
    custom = { ".git", "node_modules" },
  },
  renderer = {
    highlight_opened_files = "icon",
    icons = {
      glyphs = {
        default = "",
        git = {
          ignored = "◌",
        },
      },
    },
  },
})
