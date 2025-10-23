return {
  "zbirenbaum/copilot.lua",
  -- dependencies = { "copilotlsp-nvim/copilot-lsp" },
  opts = {
    suggestion = {
      auto_trigger = true,
      hide_during_completion = true,
      keymap = {
        accept = "<Tab>",
      },
    },
  },
}
