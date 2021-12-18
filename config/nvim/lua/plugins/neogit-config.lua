local neogit = require("neogit")

neogit.config.use_magit_keybindings()

neogit.setup({
  disable_insert_on_commit = false,
  integrations = {
    diffview = true,
  },
})
