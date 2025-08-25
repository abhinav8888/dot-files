local wezterm = require("wezterm")
local act = wezterm.action

local M = {}

function M.setup(config)
  config.keys = {
    -- Pane splitting
    { key = "d", mods = "SUPER", action = act({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },
    { key = "d", mods = "SUPER|SHIFT", action = act({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
    
    -- Pane navigation
    { key = "[", mods = "SUPER", action = act({ ActivatePaneDirection = "Next" }) },
    { key = "]", mods = "SUPER", action = act({ ActivatePaneDirection = "Prev" }) },
    
    -- Word navigation
    { key = "LeftArrow", mods = "OPT", action = wezterm.action.SendString("\x1bb") },
    { key = "RightArrow", mods = "OPT", action = wezterm.action.SendString("\x1bf") },
    
    -- Clear scrollback
    { key = "k", mods = "SUPER", action = act.ClearScrollback("ScrollbackAndViewport") },
  }
end

return M
