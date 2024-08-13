local wezterm = require 'wezterm'

return {
    default_prog = {"C:\\Users\\shashwat.singh\\AppData\\Local\\Programs\\Git\\bin\\bash.exe", "-l"},
    color_scheme = 'rose-pine',
    font = wezterm.font("JetBrains Mono"),
    window_background_opacity = 0.8,
    initial_rows = 30,
    initial_cols = 100,
    keys = {
        -- Split pane horizontally (changed to Ctrl + Shift + H)
        {key="H", mods="CTRL|SHIFT", action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},
        -- Split pane vertically (changed to Ctrl + Shift + V)
        {key="V", mods="CTRL|SHIFT", action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}},
        -- New tab
        {key="T", mods="CTRL|SHIFT", action=wezterm.action{SpawnTab="CurrentPaneDomain"}},
        -- Navigate between panes
        {key="LeftArrow", mods="ALT", action=wezterm.action{ActivatePaneDirection="Left"}},
        {key="RightArrow", mods="ALT", action=wezterm.action{ActivatePaneDirection="Right"}},
        {key="UpArrow", mods="ALT", action=wezterm.action{ActivatePaneDirection="Up"}},
        {key="DownArrow", mods="ALT", action=wezterm.action{ActivatePaneDirection="Down"}},
        -- Navigate between tabs
        {key="Tab", mods="CTRL", action=wezterm.action{ActivateTabRelative=1}},
        {key="Tab", mods="CTRL|SHIFT", action=wezterm.action{ActivateTabRelative=-1}},
        -- Close current pane with confirmation (changed to Ctrl + Shift + Q)
        {key="Q", mods="CTRL|SHIFT", action=wezterm.action{CloseCurrentPane={confirm=true}}},
    },
}
