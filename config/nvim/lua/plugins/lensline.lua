return {
  "oribarilan/lensline.nvim",
  branch = "release/2.x",
  event = "LspAttach",
  config = function()
    require("lensline").setup({
      profiles = {
        {
          name = "minimal",
          providers = {
            {
              name = "diagnostics",
              enabled = true,
              min_level = "ERROR",
            },
            {
              name = "usages",
              enabled = true,
              include = { "refs", "defs", "impls" },
              breakdown = true,
              show_zero = true,
            },
            {
              name = "complexity",
              enabled = true,
              min_level = "L",
            },
          },
          style = {
            placement = "inline",
            prefix = "",
          },
        },
      },
    })
  end,
}
