-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

config.cursor_thickness = 8
config.use_fancy_tab_bar = false
config.cursor_blink_rate = 0
config.font_size = 10
-- For example, changing the color scheme:
config.color_scheme = 'Sandcastle (base16)'
-- and finally, return the configuration to wezterm
config.keys = {
  -- Turn off the default CMD-m Hide action, allowing CMD-m to
  -- be potentially recognized and handled by the tab
  {
    key = 'd',
    mods = 'CTRL',
    action = wezterm.action.SplitVertical,
  },
  {
    key = 'w',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.CloseCurrentPane { confirm = false },
  },
  { key = 'UpArrow', mods = 'SHIFT', action = wezterm.action.ScrollByLine(-1) },
  { key = 'DownArrow', mods = 'SHIFT', action = wezterm.action.ScrollByLine(1) },
}
-- Spawn a nushell shell in login mode
config.default_prog = { '/usr/local/bin/nu' }
return config
