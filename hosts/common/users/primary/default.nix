{
  config,
  inputs,
  pkgs,
  lib,
  ...
}:
let
  spec = config.hostSpec;
  pubKeys = lib.filesystem.listFilesRecursive (relativeToRoot "common/users/keys/shared");
in
{
  users.users.${spec.username} = {
    name = spec.username;
    home = spec.home;

    openssh.authorizedKeys.keys = lib.lists.forEach pubKeys (key: builtins.readFile key);
  };

  systemd.tmpfiles.rules =
    let
      user = config.users.users.${hostSpec.username}.name;
      group = config.users.users.${hostSpec.username}.group;
    in
    # you must set the rule for .ssh separately first, otherwise it will be automatically created as root:root and .ssh/sockects will fail
    [
      "d /home/${hostSpec.username}/.ssh 0750 ${user} ${group} -"
      "d /home/${hostSpec.username}/.ssh/sockets 0750 ${user} ${group} -"
    ];

  programs.zsh.enable = true;
}
