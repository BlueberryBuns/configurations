rebuild:
  sudo nixos-rebuild switch --show-trace --flake .#aio

dry-run:
  sudo nixos-rebuild dry-run --show-trace --flake .#aio
