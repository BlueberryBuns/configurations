{
  inputs,
  outputs,
  config,
  lib,
  pkgs,
  systemVariation,
  ...
}:
{
  imports = lib.flatten [
    inputs.home-manager."${systemVariation}Modules".home-manager
    inputs.sops-nix."${systemVariation}Modules".sops

    (map lib.custom.relativeToRoot [
      "internal/host-spec.nix"
      "hosts/common/required/ssh.nix"
    ])
  ];

  networking.hostName = config.hostSpec.hostname;

  ### System wide package in case we need to log in as root (usually disabled)
  environment.systemPackages = [ pkgs.openssh ];

  home-manager = {
    useGlobalPkgs = true;
    backupFileExtension = "hmbk";
  };

  #
  # ========== Overlays ==========
  #
  nixpkgs = {
    overlays = [
      outputs.overlays.default
    ];
    config = {
      allowUnfree = true;
    };
  };

  #
  # ========== Nix Nix Nix ==========
  #
  nix = {
    # This will add each flake input as a registry
    # To make nix3 commands consistent with your flake
    registry = lib.mapAttrs (_: value: { flake = value; }) inputs;

    # This will add your inputs to the system's legacy channels
    # Making legacy nix commands consistent as well, awesome!
    nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;

    settings = {
      # See https://jackson.dev/post/nix-reasonable-defaults/
      connect-timeout = 5;
      log-lines = 25;
      min-free = 128000000; # 128MB
      max-free = 1000000000; # 1GB

      trusted-users = [ "@wheel" ];
      # Deduplicate and optimize nix store
      auto-optimise-store = true;
      warn-dirty = false;

      allow-import-from-derivation = true;

      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };

}
