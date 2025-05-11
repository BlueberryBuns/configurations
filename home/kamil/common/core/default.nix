{
  hostSpec,
  config,
  pkgs, 
  lib,
  ...
}:

{
  imports = lib.flatten [
    (map lib.custom.relativeToRoot [
      "internal/host-spec.nix"
    ])

    ./cli
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

    sessionVariables = {
      SHELL = "zsh";
      TERM = "kitty";
      TERMINAL = "kitty";
      VISUAL = "vim";
      EDITOR = "vim";
      # MANPAGER = "batman"; # see ./cli/bat.nix
    };
  };

  home.packages = with pkgs; [
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
