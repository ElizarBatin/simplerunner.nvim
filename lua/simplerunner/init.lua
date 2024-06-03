local M = {}


function my_help_opener(help_str)
  local win_id
  -- Iterate over the existing windows. If any of them has `ft=help` or `ft=man`, then
  -- set `win_id` to point to that window. This is straightforward today.

  local win_open_spec
  if win_id then
    win_open_spec = {
      win_id = win_id,
      type = 'open_in_existing',
    }
  else
    win_open_spec = {
      type = 'vsplit_in_editor',
      dir = 'right'
    }
  end

  nvim.api.open_buffer(nvim.api.make_help_buffer(help_str), win_open_spec)
end

function M.setup(opts)
  opts = opts or {}
  print("Hello world!")
  my_help_opener("Hello world")
end

return M
