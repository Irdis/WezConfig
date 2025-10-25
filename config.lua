local wezterm = require 'wezterm'
local act = wezterm.action
local config = {}

local at_work = wezterm.hostname() ~= 'Lenovo-PC'
local home_dir
if at_work then
    home_dir = 'c:\\Users\\inovitski'
else
    home_dir = 'c:\\Users\\user'
end

config.window_decorations = "INTEGRATED_BUTTONS"
config.font_size = 11.5
config.font = wezterm.font 'FiraCode Nerd Font'
config.freetype_load_target  = "HorizontalLcd"
config.window_close_confirmation = "NeverPrompt"
config.adjust_window_size_when_changing_font_size = false

config.background = {
    {
        source = {
            File = wezterm.config_dir .. '\\.wezterm\\forest_small.jpg',
        },
    },
    {
        source = { Color = '#2D353B' },
		height = "100%",
		width = "100%",
        opacity = 0.9
    },
}

config.window_padding = {
  left = 2,
  right = 2,
  top = 4,
  bottom = 0,
}
wezterm.on('cd-home', function(_, pane)
    pane:send_text('cd ' .. home_dir .. '\r\n')
end)
wezterm.on('cd-collateral', function(_, pane)
    pane:send_text('cd c:\\Repo\\hazeltree\\collateral\\Collateral\r\n')
end)
wezterm.on('cd-main', function(_, pane)
    pane:send_text('cd c:\\Repo\\hazeltree\\main\\HTFS\r\n')
end)
wezterm.on('cd-ui', function(_, pane)
    pane:send_text('cd c:\\Repo\\hazeltree\\ui\\HTFS_UI\\htfs\r\n')
end)
wezterm.on('cd-root', function(_, pane)
    pane:send_text('cd c:\\Repo\\hazeltree\r\n')
end)
wezterm.on('cd-proj', function(_, pane)
    pane:send_text('cd c:\\Projects\r\n')
end)
wezterm.on('cd-nvim', function(_, pane)
    pane:send_text('cd ' .. home_dir .. '\\AppData\\Local\\nvim\r\n')
end)
wezterm.on('cd-term', function(_, pane)
    pane:send_text('cd ' .. home_dir .. '\\.wezterm\r\n')
end)

config.keys = {
  { key = 'w', mods = 'CMD', action = wezterm.action.CloseCurrentPane { confirm = false }, },
  { key = 'h', mods = 'ALT', action = wezterm.action.EmitEvent 'cd-home', },
  { key = 'r', mods = 'ALT', action = wezterm.action.EmitEvent 'cd-root', },
  { key = 'p', mods = 'ALT', action = wezterm.action.EmitEvent 'cd-proj', },
  { key = 'u', mods = 'ALT', action = wezterm.action.EmitEvent 'cd-ui', },
  { key = 'm', mods = 'ALT', action = wezterm.action.EmitEvent 'cd-main', },
  { key = 'c', mods = 'ALT', action = wezterm.action.EmitEvent 'cd-collateral', },
  { key = 'v', mods = 'ALT', action = wezterm.action.EmitEvent 'cd-nvim', },
  { key = 't', mods = 'ALT', action = wezterm.action.EmitEvent 'cd-term', },
  { key = '-', mods = 'ALT', action = wezterm.action.DecreaseFontSize },
  { key = '=', mods = 'ALT', action = wezterm.action.IncreaseFontSize },
  { key = '0', mods = 'ALT', action = wezterm.action.ResetFontSize },
  { key = 'LeftArrow', mods = 'ALT', action = act.MoveTabRelative(-1) },
  { key = 'RightArrow', mods = 'ALT', action = act.MoveTabRelative(1) },
  { key = '0', mods = 'CTRL', action = wezterm.action.DisableDefaultAssignment },
  {
      key = 'F12',
      action = act.PromptInputLine {
          description = 'Enter new name for tab',
          initial_value = '',
          action = wezterm.action_callback(function(window, pane, line)
              if line then
                  window:active_tab():set_title(line)
              end
          end),
      },
  }
}

return config
