{
  config,
  inputs,
  pkgs,
  lib,
  ...
}:
let
  spec = config.hostSpec;
in
{
  users.users.${spec.username} = {
    name = spec.username;

    inherit (spec)
      home
      ;
  };

  programs.zsh.enable = true;
}
