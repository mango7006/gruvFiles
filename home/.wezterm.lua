-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- Changing WezTerm color scheme - https://wezfurlong.org/wezterm/colorschemes/index.html
config.color_scheme = "Gruvbox dark, medium (base16)"

-- Change Wezterm Font
config.font = wezterm.font_with_fallback({
	"JetBrainsMono Nerd Font",
	"Symbols Nerd Font",
	"awesome-terminal-fonts",
})

config.font_size = 14

-- Bug in Wezterm, disable when using Hyprland
config.enable_wayland = false

config.enable_tab_bar = false

config.prefer_egl = true

config.default_cursor_style = "SteadyBar"

config.cursor_thickness = "2px"

return config
