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
    preferXdgDirectories = true;
    
    sessionPath = [
      "$HOME/.local/bin"
    ];

    sessionVariables = {
      SHELL = "zsh";
      TERM = "kitty";
      TERMINAL = "kitty";
      VISUAL = "vim";
      EDITOR = "vim";
      MANPAGER = "batman";
    };
  };
  
  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;

      desktop = "${config.homeDirectory}/.desktop";
      documents = "${config.homeDirectory}/docs";
      downloads = "${config.homeDirectory}/downloads";
      desktop = "${config.homeDirectory}/media/audio";
      pictures = "${config.homeDirectory}/media/pictures";
      videos = "${config.homeDirectory}/media/video";
    };

    extraConfig = {
      XDG_PUBLICSHARE_DIR = "/var/empty";
      XDG_TEMPLATES_DIR = "/var/empty";
    };
  };

  home.packages = with pkgs; [
    fastfetch
    tree
    btop
    ripgrep
    eza
    fzf
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
