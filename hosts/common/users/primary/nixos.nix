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

    };

    root = {
      shell = pkgs.zsh;
      hashedPassword = "$y$j9T$KoNEKfrUeX.HITNeGrQst1$J7JfKqilPXeiN6RuMOMK80hPy9aRVxDZ/YgKHrEbtf1";
      openssh.authorizedKeys.keys = config.users.users.${spec.username}.openssh.authorizedKeys.keys;
    };

  };

  programs.zsh.enable = true;
  programs.git.enable = true;
}
// lib.optionalAttrs (inputs ? "home-manager") {
  
  home-manager.users.root = lib.optionalAttrs (!spec.isMinimal) {
    home.stateVersion = "24.11";
    programs.zsh.enable = true;
  };
}
