local wezterm = require("wezterm")
local config = {}

local font = wezterm.font("JetBrains Mono")
config.color_scheme = "Palenight (Gogh)"
config.font = font

config.window_frame = {
	font = wezterm.font({ family = "JetBrains Mono", weight = "Bold" }),
	-- active_titlebar_bg = '#333333'
	-- inactive_titlebar_bg = '#333333'
	-- font_size = 12.0
}

-- SHELL
config.default_prog = { "C:/Program Files/PowerShell/7/pwsh.exe", "-NoExit" }
config.default_cwd = "C:/Development"

-- KEYBINDINGS
config.keys = {
	--wezterm show-keys --lua to see the assignments in a form that can be copied into configuration
	-- PANES
	-- PANE SPLITS
	{ key = "\\", mods = "ALT", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "-",  mods = "ALT", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
	-- PANE CLOSING
	{ key = "w",  mods = "ALT", action = wezterm.action.CloseCurrentPane({ confirm = true }) },
	-- PANE SELECTION
	{ key = "p",  mods = "ALT", action = wezterm.action.PaneSelect },
	{
		key = "P",
		mods = "ALT",
		action = wezterm.action.PaneSelect({
			mode = "SwapWithActive",
		})
	},
	{ key = "j", mods = "ALT",      action = wezterm.action.ActivatePaneDirection("Down") },
	{ key = "l", mods = "ALT",      action = wezterm.action.ActivatePaneDirection("Right") },
	{ key = "h", mods = "ALT",      action = wezterm.action.ActivatePaneDirection("Left") },
	{ key = "k", mods = "ALT",      action = wezterm.action.ActivatePaneDirection("Up") },
	-- Quit Wezterm
	{ key = "q", mods = "ALT",      action = wezterm.action.QuitApplication },
	-- Show Launcher
	{ key = "L", mods = "ALT",      action = wezterm.action.ShowLauncher },
	-- Tab Navigator
	{ key = "t", mods = "ALT",      action = wezterm.action.ShowTabNavigator },
	{ key = "h", mods = "CTRL|ALT", action = wezterm.action.ActivateTabRelative(-1) },
	{ key = "l", mods = "CTRL|ALT", action = wezterm.action.ActivateTabRelative(1) },
	-- Close tab
	{ key = "W", mods = "ALT",      action = wezterm.action.CloseCurrentTab({ confirm = true }) },
}

-- Set up tab bindings
for i = 1, 8 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "CTRL|ALT",
		action = wezterm.action.MoveTab(i - 1),
	})
end

return config
