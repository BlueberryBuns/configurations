{
  inputs,
  config,
  pkgs,
  lib,
  ...
}:

{
  programs.ssh = lib.optionalAttrs pkgs.stdenv.isLinux {
    startAgent = true;
    enableAskPassword = true;
    askPassword = pkgs.lib.mkForce "${pkgs.ksshaskpass.out}/bin/ksshaskpass";
  };
}
