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
          },
          style = {
            placement = "inline",
            prefix = "",
            render = "focused",
          },
        },
      },
    })
  end,
}
