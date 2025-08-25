local wezterm = require("wezterm")

local M = {}

-- Available fonts
M.fonts = {
  fira_code = "Fira Code",
  meslo = "MesloLGS Nerd Font Mono",
}

-- Current active font (can be changed easily)
M.active_font = nil  -- nil means use default

function M.setup(config)
  if M.active_font then
    config.font = wezterm.font(M.active_font)
  end
  -- Add any other font-related settings here
end

function M.set_font(font_name)
  if M.fonts[font_name] then
    M.active_font = M.fonts[font_name]
  else
    wezterm.log_error("Font not found: " .. font_name)
  end
end

return M
