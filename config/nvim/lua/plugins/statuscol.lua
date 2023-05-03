-- TODO: Toggle breakpoint kind of look kind of out of place. It also moves the gitsigns
return {
  "luukvbaal/statuscol.nvim",
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
          sign = {
            name = { "todo*" },
            maxwidth = 1,
          },
        },
        { text = { builtin.lnumfunc }, click = "v:lua.ScLa" },
        {
          sign = { name = { ".*" }, maxwidth = 2, colwidth = 1, wrap = true },
          click = "v:lua.ScSa",
        },
      },
    })
  end,
}
