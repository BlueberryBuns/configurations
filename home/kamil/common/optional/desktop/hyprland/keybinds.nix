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
      "CTRL,space,exec,rofi -show drun"
      "SHIFT_ALT,space,exec,rofi -show run"
      "SUPER,s,exec,rofi -show ssh"
      "ALT,tab,exec,rofi -show window"
      "SUPER,c,killactive"

      "ALT,Return,exec,${terminal}"
      "CTRL_ALT,v,exec,${terminal} ${editor}"
    ]
    ++ (
      builtins.concatLists (builtins.genList (i: 
        let workspaceNumber = i + 1;
        in [
          "CTRL, code:1${toString i}, workspace, ${toString workspaceNumber}"
          "SHIFT_ALT, code:1${toString i}, movetoworkspace, ${toString workspaceNumber}"
        ])
      9)
    );
  };

}
