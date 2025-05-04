{
  config,
  pkgs,
  lib,
  ...
}:

{
  options.hostSpec = {
    hostname = lib.mkOption {
      type = lib.types.str;
      description = "The hostname of the unit";
    };

    system = lib.mkOption {
      type = lib.types.enum [ "darwin" "nixos" ];
      description = "The type of system for the deployment target";
    };
  };
}
