local wezterm = require("wezterm")
local act = wezterm.action

local config={}
--use config builder if possible--
if wezterm.config_builder then config=wezterm.config_builder() end

--settings--
config.default_prog={ "C:\\Users\\shashwat.singh\\AppData\\Local\\Programs\\Git\\bin\\bash.exe", "-l" }
config.color_scheme="rose-pine"
config.font=wezterm.font("JetBrains Mono")
config.initial_rows=30
config.initial_cols=100
config.window_background_opacity=0.7
config.window_decorations="INTEGRATED_BUTTONS|RESIZE"

--Keys
config.leader={key="a", mods="CTRL", timeout_milliseconds=1000}
config.keys={
  {key="a",mods="LEADER",action=act.SendKey {key="a",mods="CTRL"}},
  {
    key="v",
    mods="LEADER",action=act.SplitHorizontal {domain="CurrentPaneDomain"}
  },
{key="-",
  mods="LEADER",
  action=act.SplitVertical
      {domain="CurrentPaneDomain"}
},
  {key="h",mods="LEADER",action=act.ActivatePaneDirection("Left")},
  {key="j",mods="LEADER",action=act.ActivatePaneDirection("Down")},
  {key="k",mods="LEADER",action=act.ActivatePaneDirection("Up")},
  {key="l",mods="LEADER",action=act.ActivatePaneDirection("Right")},
  {key="d",mods="LEADER",action=act.CloseCurrentPane{confirm=true}},
--TERMINAL SIZE
{key="n", mods="LEADER", action=act.ToggleFullScreen,},
--shift bw tabs--
   {key="]", mods="CTRL", action=wezterm.action{ActivateTabRelative=-1}},
    {key="[", mods="CTRL", action=wezterm.action{ActivateTabRelative=1}},
}

return config
