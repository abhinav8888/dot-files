local wezterm = require("wezterm")

local M = {}

function M.setup(config)
  -- Window appearance
  config.window_background_opacity = 0.95
  config.use_fancy_tab_bar = true
  config.show_new_tab_button_in_tab_bar = true
  
  -- Cursor settings
  config.cursor_thickness = "4pt"
  config.default_cursor_style = "SteadyBlock"

end

return M
