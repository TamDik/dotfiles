-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.color_scheme = 'iceberg-dark'
config.font_size = 17
config.window_background_opacity = 0.7


return config
