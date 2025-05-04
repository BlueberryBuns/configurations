{
  userSpec,
  hostSpec,
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = lib.flatten [
    (map lib.custom.relativeToRoot [
      "internal/host-spec.nix"
    ])
  ];
}
