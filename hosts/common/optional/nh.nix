{ config, pkgs, lib, ... }:

{
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = lib.custom.relativeToRoot ".";  # Point to root directory
  };
}
