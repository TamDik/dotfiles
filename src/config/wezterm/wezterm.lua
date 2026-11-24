local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- Homebrew cask のフォントは ~/Library/Fonts に入るが、CoreText 経由だと
-- 見つからないことがあるため明示的に読み込む
config.font_dirs = { wezterm.home_dir .. '/Library/Fonts' }
config.font = wezterm.font_with_fallback({
  'JetBrains Mono',
  'Noto Sans Mono CJK JP',
  'Hiragino Sans',
})
config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }
config.color_scheme = 'iceberg-dark'
config.font_size = 14
config.window_background_opacity = 0.8
config.window_decorations = "RESIZE"
config.window_padding = {
  left = 2,
  right = 2,
  top = 0,
  bottom = 0,
}
config.audible_bell = "Disabled"

config.visual_bell = {
  fade_in_function = 'EaseIn',
  fade_in_duration_ms = 150,
  fade_out_function = 'EaseOut',
  fade_out_duration_ms = 150,
}
config.colors = {
  visual_bell = '#202020',
}

return config
