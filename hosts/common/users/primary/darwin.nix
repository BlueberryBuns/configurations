{ config, ... }:
let
  spec = config.hostSpec;
in
{
  users.users.${spec.username} = {
    home = "/Users/${spec.username}";
  }; 
}
