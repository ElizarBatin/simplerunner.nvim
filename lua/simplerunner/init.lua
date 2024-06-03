local M = {}

function split_string(input, sep)
  if sep == nil then
    sep = "%s"
  end
  local t = {}
  for str in string.gmatch(input, "([^"..sep.."]+)") do
    table.insert(t, str)
  end
  return t
end


function M.setup(opts)
  opts = opts or {}
  print("Hello world!")
  local handle = io.popen("whoami")
  local result = handle:read("*a")
  handle:close()

  result = split_string(result, "\n")

  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, true, result)
  vim.api.nvim_buf_set_name(buf, "SimpleRunner")

  local o = {
    width = 10,
    anchor = "NW",
    split = "right"
  }
  local win = vim.api.nvim_open_win(buf, false, o)
end

return M
