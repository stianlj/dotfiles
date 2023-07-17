return {
  "gelguy/wilder.nvim",
  build = ":UpdateRemotePlugins",
  event = "VeryLazy",
  dependencies = { "romgrk/fzy-lua-native" },
  config = function()
    local wilder = require("wilder")
    wilder.setup({ modes = { ":", "/", "?" } })
    wilder.set_option("use_python_remote_plugin", 0)

    wilder.set_option("pipeline", {
      wilder.branch(
        wilder.cmdline_pipeline({
          fuzzy = 1,
          fuzzy_filter = wilder.lua_fzy_filter(),
        }),
        wilder.vim_search_pipeline()
      ),
    })

    local highlighters = {
      wilder.pcre2_highlighter(),
      wilder.basic_highlighter(),
    }

    local popupmenu_renderer = wilder.popupmenu_renderer(wilder.popupmenu_border_theme({
      min_width = "100%",
      min_height = "45%",
      empty_message = wilder.popupmenu_empty_message_with_spinner(),
      highlighter = highlighters,
      highlights = {
        accent = wilder.make_hl("WilderAccent", "Pmenu", { { a = 1 }, { a = 1 }, { foreground = "#f4468f" } }),
      },
      left = { " ", wilder.popupmenu_devicons() },
      right = { " ", wilder.popupmenu_scrollbar() },
    }))

    wilder.set_option(
      "renderer",
      wilder.renderer_mux({
        [":"] = popupmenu_renderer,
        ["/"] = wilder.wildmenu_renderer({
          highlighter = wilder.lua_fzy_highlighter(),
        }),
      })
    )
  end,
}
