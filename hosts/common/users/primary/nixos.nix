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
  users.mutableUsers = false;
  users.users = {
    ${spec.username} = {
      isNormalUser = true;
      hashedPassword = "$y$j9T$KoNEKfrUeX.HITNeGrQst1$J7JfKqilPXeiN6RuMOMK80hPy9aRVxDZ/YgKHrEbtf1";

      shell = pkgs.zsh;
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

      programs.zsh.enable = true;
      environment.systemPackages = [
        pkgs.just
        pkgs.rsync
      ];
    
    };

    root = {
      shell = pkgs.zsh;
      hashedPassword = "$y$j9T$KoNEKfrUeX.HITNeGrQst1$J7JfKqilPXeiN6RuMOMK80hPy9aRVxDZ/YgKHrEbtf1";
      openssh.authorizedKeys.keys = config.users.users.${hostSpec.username}.openssh.authorizedKeys.keys;
    };

  };

  programs.git.enable = true;
}
