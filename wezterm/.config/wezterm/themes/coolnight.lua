-- Coolnight (WezTerm)
-- By Josean Martinez — inspired by aura.toml

local wezterm = require("wezterm")
print("Coolnight theme")

return {
  color_schemes = {
    ["Coolnight"] = {
      foreground = "#CBE0F0",
      background = "#011423",

      -- Cursor
      cursor_bg = "#47FF9C",
      cursor_fg = "#011423",
      cursor_border = "#47FF9C",

      -- (Optional) selection colors — tweak if you like
      selection_bg = "#214969",
      selection_fg = "#CBE0F0",

      ansi = {
        "#214969", -- black
        "#E52E2E", -- red
        "#44FFB1", -- green
        "#FFE073", -- yellow
        "#0FC5ED", -- blue
        "#a277ff", -- magenta
        "#24EAF7", -- cyan
        "#24EAF7", -- white
      },
      brights = {
        "#214969", -- bright black
        "#E52E2E", -- bright red
        "#44FFB1", -- bright green
        "#FFE073", -- bright yellow
        "#A277FF", -- bright blue
        "#a277ff", -- bright magenta
        "#24EAF7", -- bright cyan
        "#24EAF7", -- bright white
      },
    },
  },
  color_scheme = "Coolnight",
}

