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
      type = lib.types.enum [
        "darwin"
        "nixos"
      ];
      description = "The type of platform for the deployment target, i.e. darwin / nixos";
    };

    username = lib.mkOption {
      type = lib.types.str;
      description = "The name of the main username of the host";
    };

    persistFolder = lib.mkOption {
      type = lib.types.str;
      description = "Default value for persistent values in the drive";
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

    isMinimal = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Specifies if user is designated for bootstrap usage";
    };

  };
}
