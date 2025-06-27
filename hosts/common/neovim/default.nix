{
  pkgs,
  inputs,
  lib,
  config,
  ...
}:
let
  # spec = config.hostSpec;
in
{
  imports = lib.flatten [
    inputs.nvf.nixosModules.default
    
    (map lib.custom.relativeToRoot [
      "hosts/common/neovim/kamil" #${spec.username}"
    ])
  ];
}
