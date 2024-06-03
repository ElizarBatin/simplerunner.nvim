local M = {}


function M.setup(opts)
  opts = opts or {}
  print("Hello world!")
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, true, {"test", "text"})
  vim.api.nvim_buf_set_name(buf, "SimpleRunner")

  local o = {
    width = 15,
    anchor = "NW",
    split = "right"
  }
  local win = vim.api.nvim_open_win(buf, false, o)
end

return M
