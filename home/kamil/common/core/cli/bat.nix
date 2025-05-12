# https://github.com/sharkdp/bat
# https://github.com/eth-p/bat-extras

{ pkgs, ... }:
{
  programs.bat = {
    enable = true;
    config = {
      style = "changes,header";
    };
    extraPackages = builtins.attrValues {
      inherit (pkgs.bat-extras)
        batgrep
        batdiff
        batman
        ;
    };
  };

  home.activation.batCacheRebuild = {
    after = [ "linkGeneration" ];
    before = [ ];
    data = ''
      ${pkgs.bat}/bin/bat cache --build
    '';
  };

}
