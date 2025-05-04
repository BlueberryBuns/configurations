{ 
  inputs,
  config,
  lib,
  pkgs,
  ...
}:

{
  users.users.kamil = {
    isNormalUser = true;
    description = "kamil";
    extraGroups = lib.flatten [
      "wheel"
      (lib.custom.ifGroupsExits [
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
