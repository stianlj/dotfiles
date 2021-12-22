local M = {}

-- TODO: Look into map and filter from http://lua-users.org/wiki/FunctionalLibrary
-- TODO: Dont need this. Check out vim.tbl_contains, vim.tbl_map and vim.tbl_filter

M.has_value = function(table, value)
  for _, v in ipairs(table) do
    if v == value then
      return true
    end
  end
  return false
end

return M
