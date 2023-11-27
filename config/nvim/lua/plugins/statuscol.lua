return {
  "luukvbaal/statuscol.nvim",
  -- TODO: Remove this when fix is merged
  branch = "0.10",
  config = function()
    local builtin = require("statuscol.builtin")
    require("statuscol").setup({
      relculright = true,
      segments = {
        { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
        {
          sign = { name = { "Diagnostic" }, maxwidth = 1 },
          click = "v:lua.ScSa",
        },
        {
          sign = { name = { "Dap*" }, auto = true },
          click = "v:lua.ScSa",
        },
        { text = { builtin.lnumfunc }, click = "v:lua.ScLa" },
        {
          sign = { namespace = { "gitsign*" } },
          click = "v:lua.ScSa",
        },
      },
    })
  end,
}
