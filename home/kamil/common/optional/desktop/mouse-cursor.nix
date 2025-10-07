{ pkgs, ... }:

{
  home.pointerCursor = {
    name = "phinger-cursors-light";
    package = pkgs.phinger-cursors;
    size = 64;
    gtk.enable = true;
  };
}
