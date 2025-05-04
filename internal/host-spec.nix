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

    platform = lib.mkOption {
      type = lib.types.enum [ "darwin" "nixos" ];
      description = "The type of platform for the deployment target, i.e. darwin / nixos";
    };

    username = lib.mkOption {
      type = lib.types.str;
      description = "The name of the main username of the host";
    };

    home = lib.mkOption {
      type = lib.types.path;
      description = "Home directory for specific user";
      default =
        let
          user = config.hostSpec.username;
        in 
        if pkgs.stdenv.isLinux then "/home/${user}" else "/User/${user}";
    };
  };
}
