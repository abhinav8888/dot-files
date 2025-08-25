local wezterm = require("wezterm")
local coolnight = require("themes.coolnight")
local reddit = require("themes.reddit")

local M = {}

-- Available themes
M.themes = {
  coolnight = coolnight,
  reddit = reddit,
}

-- Current active theme
M.active_theme = "coolnight"

function M.setup(config)
  -- Apply custom color schemes
  local scheme = wezterm.color.get_builtin_schemes()["Catppuccin Mocha"]
  scheme.selection_bg = "#FFFFFF"
  scheme.selection_fg = "#000000"
  
  config.color_schemes = {
    ["Catppuccin Mocha"] = scheme,
  }
  
  -- Set the active color scheme
  -- if M.active_theme == "coolnight" then
  --   config.color_scheme = coolnight.color_scheme
  -- elseif M.active_theme == "reddit" then
  --   reddit.apply_to_config(config)
  -- else
  --   config.color_scheme = "AdventureTime"  -- fallback
  -- end
  config.color_scheme = coolnight.color_scheme
end

function M.set_theme(theme_name)
  if M.themes[theme_name] then
    M.active_theme = theme_name
  else
    wezterm.log_error("Theme not found: " .. theme_name)
  end
end

return M
