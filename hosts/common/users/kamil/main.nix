{ 
  inputs,
  config,
  lib,
  pkgs,
  ...
}:
let
  ifGroupExits = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in 
{
  users.users.kamil = {
    isNormalUser = true;
    description = "kamil";
    extraGroups = lib.flatten [
      "wheel"
      (ifGroupExits [
        "audio"
        "video"
        "docker"
        "git"
        "networkmanager"
      ])
    ];
  };

  programs.git.enable = true;
}
