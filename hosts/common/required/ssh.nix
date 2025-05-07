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

    knownHostsFiles =
      [
        (pkgs.writeText "custom_known_hosts" ''
          ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDcoV3PTZgDkxVYw+9gJMxiBseJGfNL5d3XJ0GTsxeoP hulewicz.k@gmail.com
         '')
      ];
  };
}
