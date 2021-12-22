local M = {}

M.setup = function(config)
  local luadev = require("lua-dev").setup({
    lspconfig = config.opts,
  })
  return luadev
end

return M
