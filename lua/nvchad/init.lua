local new_cmd = vim.api.nvim_create_user_command
local config = require("core.utils").load_config().ui

if config.tabufline.enabled then
  require "nvchad.tabufline.lazyload"
end

-- command to toggle cheatsheet
new_cmd("NvCheatsheet", function()
  if vim.g.nvcheatsheet_displayed then
    require("nvchad.tabufline").close_buffer()
  else
    require("nvchad.cheatsheet." .. config.cheatsheet.theme)()
  end
end, {})

