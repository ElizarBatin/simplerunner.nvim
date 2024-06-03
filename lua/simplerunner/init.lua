local M = {}


function M.setup(opts)
  opts = opts or {}
  print("Hello world!")
  local handle = io.popen("whoami")
  local result = handle:read("*a")
  handle:close()

  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, true, {result, "text"})
  vim.api.nvim_buf_set_name(buf, "SimpleRunner")

  local o = {
    width = 10,
    anchor = "NW",
    split = "right"
  }
  local win = vim.api.nvim_open_win(buf, false, o)
end

return M
