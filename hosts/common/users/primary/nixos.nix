{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:
let
  spec = config.hostSpec;
  ifGroupExits = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in 
{
  users.mutableUsers = true;
  users.users.${spec.username} = {
    isNormalUser = true;
    initialHashedPassword = "$y$j9T$KoNEKfrUeX.HITNeGrQst1$J7JfKqilPXeiN6RuMOMK80hPy9aRVxDZ/YgKHrEbtf1";

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
