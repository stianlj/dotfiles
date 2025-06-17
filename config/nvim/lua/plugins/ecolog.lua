---@type LazySpec
return {
  "t3ntxcl3s/ecolog.nvim",
  keys = {
    { "<leader>eg", "<cmd>EcologGoto<cr>", desc = "Go to env file" },
    { "<leader>ep", "<cmd>EcologPeek<cr>", desc = "Ecolog peek variable" },
    { "<leader>es", "<cmd>EcologSelect<cr>", desc = "Switch env file" },
  },
  lazy = false,
  opts = {
    integrations = {
      blink_cmp = true,
      lspsaga = true,
    },
    load_shell = {
      enabled = true,
      override = false,
    },
    types = true,
    path = vim.fn.getcwd(), -- Path to search for .env files
    preferred_environment = "development", -- Optional: prioritize specific env files
    provider_patterns = true, -- true by default, when false will not check provider patterns
  },
}
