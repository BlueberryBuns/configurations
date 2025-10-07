{
  lib,
  pkgs,
  stdenv,
  ...
}:
let

in
{
  packages.${pkgs.system}.defauult = stdenv.mkDerivation {
    name = "my-shell";
    src = ./.;

    nativeBuildInputs = with pkgs; [
      meson
      vala
    ];
  };
}

