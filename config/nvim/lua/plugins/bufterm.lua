return {
  "boltlessengineer/bufterm.nvim",
  config = function()
    require("bufterm").setup()
    local Terminal = require("bufterm.terminal").Terminal
    local ui = require("bufterm.ui")
    local term = Terminal:new({
      cmd = "/usr/bin/fish",
      buflisted = false,
      termlisted = false,
    })

    vim.keymap.set({ "n", "t" }, "<C-t>", function()
      term:spawn()
      ui.toggle_float(term.bufnr)
    end, {
      desc = "Toggle floating window with terminal buffers",
    })
  end,
}
