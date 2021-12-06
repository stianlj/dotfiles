vim.opt.completeopt = { "menu", "menuone", "noselect" }

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp = require("cmp")
local lspkind = require("lspkind")

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))

cmp.setup({
  sources = cmp.config.sources({
    { name = "nvim_lua" },
    { name = "nvim_lsp" },
    { name = "path" },
    { name = "buffer", keyword_length = 5 },
  }),
  completion = {
    keyword_length = 2,
  },
  mapping = {
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
    ["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
    ["<Down>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
    ["<Up>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
  },
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  formatting = {
    format = lspkind.cmp_format({
      with_text = true,
      menu = {
        buffer = "[buf]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[api]",
        path = "[path]",
        luasnip = "[snip]",
      },
    }),
  },
  experimental = {
    native_menu = false,
    ghost_text = true,
  },
})
