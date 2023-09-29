return {
  "lukas-reineke/indent-blankline.nvim",
  opts = {
    indent = { char = "│" },
    scope = {
      enabled = true,
      show_start = false,
      show_end = false,
      injected_languages = false,
      highlight = { "Function", "Label" },
      priority = 500,
    },
    exclude = {
      filetypes = {
        "help",
        "alpha",
        "dashboard",
        "*oil*",
        "neo-tree",
        "Trouble",
        "lazy",
        "mason",
        "notify",
        "toggleterm",
        "lazyterm",
        "asm",
      },
    },
  },
  main = "ibl",
}
