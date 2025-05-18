{
  inputs,
  config,
  pkgs,
  lib,
  ...
}:

{
  imports = [ inputs.ags.homeManagerModules.default ];

  home.packages = [ pkgs.networkmanagerapplet ];
  
  programs.ags = {
    enable = true;
    
    configDir = ./config;
    
    extraPackages = with pkgs; [
      gtksourceview
      webkitgtk
      accountsservice
    ];
  };
}
