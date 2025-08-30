return {
  "olimorris/codecompanion.nvim",
  opts = {
    prompt_library = {
      ["Commit Message"] = {
        strategy = "inline",
        description = "Generate a commit message",
        opts = {
          short_name = "commit_message",
          auto_submit = true,
          placement = "replace",
        },
        prompts = {
          {
            role = "user",
            content = function()
              return string.format(
                [[You are an expert at following the Conventional Commit specification. Given the git diff listed below, please generate a commit message for me:

` ` `diff
%s
` ` `

When unsure about the module names to use in the commit message, you can refer to the last 20 commit messages in this repository:

` ` `
%s
` ` `

Output only the commit message without any explanations and follow-up suggestions.
]],
                vim.fn.system("git diff --no-ext-diff --staged"),
                vim.fn.system('git log --pretty=format:"%s" -n 20')
              )
            end,
            opts = {
              contains_code = true,
            },
          },
        },
      },
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
}
