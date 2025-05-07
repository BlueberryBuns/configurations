{
  config,
  inputs,
  pkgs,
  lib,
  ...
}:
let
  spec = config.hostSpec;
  pubKeys = lib.filesystem.listFilesRecursive (lib.custom.relativeToRoot "hosts/common/users/keys/shared");
in
{
  users.users.${spec.username} = {
    name = spec.username;
    home = spec.home;

    openssh.authorizedKeys.keys = lib.lists.forEach pubKeys (key: builtins.readFile key);
  };

  systemd.tmpfiles.rules =
    let
      user = config.users.users.${spec.username}.name;
      group = config.users.users.${spec.username}.group;
    in
    # you must set the rule for .ssh separately first, otherwise it will be automatically created as root:root and .ssh/sockects will fail
    [
      "d /home/${spec.username}/.ssh 0750 ${user} ${group} -"
      "d /home/${spec.username}/.ssh/sockets 0750 ${user} ${group} -"
    ];

  programs.zsh.enable = true;
  
  environment.systemPackages = [
    pkgs.just
    pkgs.rsync
  ];
}
