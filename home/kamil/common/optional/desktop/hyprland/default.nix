{
  pkgs,
  config,
  lib,
  ...
}:

{
  imports = [
    ./keybinds.nix
  ];
  wayland.windowManager.hyprland = {
    enable = true;

    package = pkgs.hyprland;

    systemd = {
      enable = true;
      variables = [ "--all" ]; # fix for https://wiki.hyprland.org/Nix/Hyprland-on-Home-Manager/#programs-dont-work-in-systemd-services-but-do-on-the-terminal
      # TODO(hyprland): experiment with whether this is required.
      # Same as default, but stop the graphical session too
      # extraCommands = lib.mkBefore [
      #  "systemctl --user stop graphical-session.target"
      #  "systemctl --user start hyprland-session.target"
      # ];
    };
  };
}
