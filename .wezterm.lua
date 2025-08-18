local wezterm = require("wezterm")
local reddit = require("reddit")
local config = wezterm.config_builder()
local act = wezterm.action
local theme = wezterm.plugin.require("https://github.com/neapsix/wezterm").main

-- This is where you actually apply your config choices

config.color_scheme = "AdventureTime"
-- config.color_scheme = 'Catppuccin Mocha'
-- config.color_scheme = 'wilmersdorf'
-- config.color_scheme = 'AdventureTime'
-- config.color_scheme = 'MaterialOcean'
-- config.color_scheme = 'Mellifluous'
-- config.color_schemes = {
--     ['AdventureTime'] = {
--         background = 'yellow'
--     }
-- }
local scheme = wezterm.color.get_builtin_schemes()["Catppuccin Mocha"]
scheme.selection_bg = "#FFFFFF"
scheme.selection_fg = "#000000"
-- scheme.char_select_bg_color = "#333333"
-- scheme.char_select_fg_color = "#FFFFFF"
config.color_schemes = {
	["Catppuccin Mocha"] = scheme,
}
-- config.color_scheme = 'Catppuccin Mocha'

config.keys = {
	{ key = "d", mods = "SUPER", action = act({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },
	{ key = "d", mods = "SUPER|SHIFT", action = act({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
	{ key = "[", mods = "SUPER", action = act({ ActivatePaneDirection = "Next" }) },
	{ key = "]", mods = "SUPER", action = act({ ActivatePaneDirection = "Prev" }) },
	{ key = "LeftArrow", mods = "OPT", action = wezterm.action.SendString("\x1bb") },
	{ key = "RightArrow", mods = "OPT", action = wezterm.action.SendString("\x1bf") },
	{ key = "k", mods = "SUPER", action = act.ClearScrollback("ScrollbackAndViewport") },
}
config.window_background_opacity = 0.95
config.use_fancy_tab_bar = true
config.show_new_tab_button_in_tab_bar = false
config.colors = theme.colors()
config.colors.cursor_fg = "white"
config.colors.cursor_bg = "#FF33FF"
config.window_frame = theme.window_frame()
config.cursor_thickness = "1pt"
config.default_cursor_style = "SteadyBlock"
-- wezterm.plugin.require('https://github.com/yriveiro/wezterm-tabs').apply_to_config(config, { tabs = { tab_bar_at_bottom = false } })
-- local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
-- tabline.setup()
-- tabline.apply_to_config(config)
-- config.color_scheme = 'Mellifluous'
-- config.font = wezterm.font 'MesloLGS Nerd Font Mono'
-- reddit.apply_to_config(config)
config.font = wezterm.font("Fira Code")
config.color_scheme = "AdventureTime"
return config
