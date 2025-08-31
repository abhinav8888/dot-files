local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Since modules are in ~/.config/wezterm/, we can require them directly
local keybindings = require("keybindings")
local appearance = require("appearance")  
local themes = require("themes")
local fonts = require("fonts")

-- Apply configurations from modules
appearance.setup(config)
themes.setup(config)
fonts.setup(config)
keybindings.setup(config)

return config
