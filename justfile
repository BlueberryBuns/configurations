rebuild-fractal:
  nh os switch --hostname fractal . -- --show-trace

dry-run:
  sudo nixos-rebuild dry-run --show-trace --flake .#fractal
