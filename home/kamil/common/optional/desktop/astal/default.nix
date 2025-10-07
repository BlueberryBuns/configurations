{ inputs, pkgs, ... }:

{
  home.packages = [ inputs.astal.packages.${pkgs.system}.default ];
}
