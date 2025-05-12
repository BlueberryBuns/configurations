rebuild:
  sudo nixos-rebuild switch --show-trace --flake .#fractal

dry-run:
  sudo nixos-rebuild dry-run --show-trace --flake .#fractal
