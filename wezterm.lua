local wezterm = require 'wezterm'

local config = wezterm.config_builder()

-- UI
config.color_scheme = 'Solarized (dark) (terminal.sexy)'

-- Font
config.font = wezterm.font('JetBrainsMono Nerd Font', {weight = 'Regular'})
config.font_size = 12

config.window_padding = {
  left = 0,
  right = 0,
  top = 10,
  bottom = 0
}

config.audible_bell = 'Disabled'
config.hide_tab_bar_if_only_one_tab = true
config.warn_about_missing_glyphs = false

return config

