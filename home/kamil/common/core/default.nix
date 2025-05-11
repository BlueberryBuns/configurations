{
  hostSpec,
  config,
  pkgs, 
  lib,
}:
let
  inherit (hostSpec) platform;
in 
{
  imports = lib.flatten [
    (map lib.custom.relativeToRoot [
      "internal/host-spec.nix"
    ])
    ./${platform}.nix
  ];

  inherit hostSpec;
  services.ssh-agent.enable = true;

  home = {
    username = lib.mkDefault config.hostSpec.username;
    homeDirectory = lib.mkDefault config.hostSpec.home;
    stateVersion = lib.mkDefault "24.11";
    sessionPath = [
      "$HOME/.local/bin"
    ];
  };

  home.packages = [
    fastfetch
    tree
    btop
  ];

    nix = {
    package = lib.mkDefault pkgs.nix;
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      warn-dirty = false;
    };
  };

  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
}
