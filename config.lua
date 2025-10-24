local wezterm = require 'wezterm'
local act = wezterm.action
local config = {}

config.window_decorations = "INTEGRATED_BUTTONS"
config.font_size = 11.5
config.font = wezterm.font 'FiraCode Nerd Font'
config.freetype_load_target  = "HorizontalLcd"
config.window_close_confirmation = "NeverPrompt"
config.adjust_window_size_when_changing_font_size = false

config.background = {
    {
        source = {
            File = '\\\\htfs.local\\Users\\SPB_Office\\inovitski\\Pictures\\taylor-wright-2aSpCOPNyO0-unsplash.jpg',
        },
        -- width = '100%',
        attachment = 'Fixed',
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
  top = 0,
  bottom = 0,
}
wezterm.on('cd-collateral', function(window, pane)
    pane:send_text 'cd c:\\Repo\\hazeltree\\collateral\\Collateral\r\n'
end)
wezterm.on('cd-main', function(window, pane)
    pane:send_text 'cd c:\\Repo\\hazeltree\\main\\HTFS\r\n'
end)
wezterm.on('cd-ui', function(window, pane)
    pane:send_text 'cd c:\\Repo\\hazeltree\\ui\\HTFS_UI\\htfs\r\n'
end)
wezterm.on('cd-root', function(window, pane)
    pane:send_text 'cd c:\\Repo\\hazeltree\r\n'
end)
wezterm.on('cd-nvim', function(window, pane)
    pane:send_text 'cd C:\\Users\\inovitski\\AppData\\Local\\nvim\r\n'
end)

-- config.leader = { key = 't', mods = 'CTRL', timeout_milliseconds = 1000 }
config.keys = {
  {
    key = 'w',
    mods = 'CMD',
    action = wezterm.action.CloseCurrentPane { confirm = false },
  },
  {
    key = 'r',
    mods = 'ALT',
    action = wezterm.action.EmitEvent 'cd-root',
  },
  {
    key = 'u',
    mods = 'ALT',
    action = wezterm.action.EmitEvent 'cd-ui',
  },
  {
    key = 'm',
    mods = 'ALT',
    action = wezterm.action.EmitEvent 'cd-main',
  },
  {
    key = 'c',
    mods = 'ALT',
    action = wezterm.action.EmitEvent 'cd-collateral',
  },
  {
    key = 'v',
    mods = 'ALT',
    action = wezterm.action.EmitEvent 'cd-nvim',
  },
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
