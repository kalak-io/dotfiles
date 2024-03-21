local wezterm = require 'wezterm'

local config = wezterm.config_builder()

-- UI
config.color_scheme = 'Solarized (dark) (terminal.sexy)'

-- Font
config.font = wezterm.font('Ubuntu Mono')
config.font_size = 14

config.window_padding = {
  left = "1cell",
  right = "1cell",
  top = "5px",
  bottom = "5px"
}


config.audible_bell = 'Disabled'
config.hide_tab_bar_if_only_one_tab = true
config.warn_about_missing_glyphs = false
config.enable_wayland = false
config.automatically_reload_config = true

config.check_for_updates = true
config.check_for_updates_interval_seconds = 86400

config.enable_scroll_bar = false
config.prefer_egl = true

return config

