return {
  "NickvanDyke/opencode.nvim",
  dependencies = {
    { "folke/snacks.nvim", opts = { input = {}, picker = {} } },
  },
  config = function()
    vim.g.opencode_opts = {
      prompts = {
        ask = { prompt = "", ask = true, submit = true },
        explain = { prompt = "Explain @this and its context", submit = true },
        optimize = { prompt = "Optimize @this for performance and readability", submit = true },
        document = { prompt = "Add comments documenting @this", submit = true },
        ["types-jsdoc"] = { prompt = "Add jsdoc type annotations to @this", submit = true },
        types = { prompt = "Add type annotations to @this", submit = true },
        test = { prompt = "Add tests for @this", submit = true },
        review = { prompt = "Review @this for correctness and readability", submit = true },
        diagnostics = { prompt = "Explain @diagnostics", submit = true },
        fix = { prompt = "Fix @diagnostics", submit = true },
        diff = { prompt = "Review the following git diff for correctness and readability: @diff", submit = true },
        buffer = { prompt = "@buffer" },
        this = { prompt = "@this" },
      },
    }

    vim.opt.autoread = true

    vim.keymap.set({ "n", "x" }, "<leader>aa", function()
      require("opencode").ask("@this: ", { submit = true })
    end, { desc = "Ask about this" })
    vim.keymap.set({ "n", "x" }, "<leader>as", function()
      require("opencode").select()
    end, { desc = "Select prompt" })
    vim.keymap.set({ "n", "x" }, "<leader>ap", function()
      require("opencode").prompt("@this")
    end, { desc = "Add this" })
    vim.keymap.set("n", "<leader>at", function()
      require("opencode").toggle()
    end, { desc = "Toggle embedded" })
    vim.keymap.set("n", "<leader>aC", function()
      require("opencode").command()
    end, { desc = "Select command" })
    vim.keymap.set("n", "<leader>an", function()
      require("opencode").command("session_new")
    end, { desc = "New session" })
    vim.keymap.set("n", "<leader>ai", function()
      require("opencode").command("session_interrupt")
    end, { desc = "Interrupt session" })
    vim.keymap.set("n", "<leader>aA", function()
      require("opencode").command("agent_cycle")
    end, { desc = "Cycle selected agent" })
    vim.keymap.set("n", "<S-C-u>", function()
      require("opencode").command("messages_half_page_up")
    end, { desc = "Messages half page up" })
    vim.keymap.set("n", "<S-C-d>", function()
      require("opencode").command("messages_half_page_down")
    end, { desc = "Messages half page down" })
  end,
}
