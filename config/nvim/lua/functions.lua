local M = {}

M.has_value = function(table, value)
  for _, v in ipairs(table) do
    if v == value then
      return true
    end
  end
  return false
end

return M
