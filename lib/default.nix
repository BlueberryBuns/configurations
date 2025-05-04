{ lib, config, ... }:

{
  relativeToRoot = lib.path.append ../.;
  ifGroupExits = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
}
