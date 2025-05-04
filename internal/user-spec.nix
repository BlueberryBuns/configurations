{
  config,
  pkgs,
  lib,
  ...
}:

{
  options.userSpec = {
    username = lib.mkOption {
      type = lib.types.str;
      description = "The hostname of the unit";
    };

    home = lib.mkOption {
      type = lib.types.str;
      description = "Home directory for specific user";
      default =
        let
          user = userSpec.username;
        in 
        if pkgs.stdenv.isLinux then "/home/${user}" else "/User/${user}";
    };
  };
}
