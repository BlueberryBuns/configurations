{
  config,
  lib,
  pkgs,
  ...
}:
{
  wayland.windowManager.hyprland.settings = {
    bind =
    let
      terminal = config.home.sessionVariables.TERM;
      editor = config.home.sessionVariables.EDITOR;
    in
    [
      "ALT,space,exec,rofi -show drun"
      "SHIFT_ALT,space,exec,rofi -show run"
      "SUPER,s,exec,rofi -show ssh"
      "ALT,tab,exec,rofi -show window"

      "ALT,Return,exec,${terminal}"
      "CTRL_ALT,v,exec,${terminal} ${editor}"
    ];
  };

}
