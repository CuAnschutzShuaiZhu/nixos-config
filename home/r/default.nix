{
  lib,
  pkgs,
  ...
}: let
  rPkgs = import ./r-packages.nix {inherit pkgs;};
in {
  home.packages = with pkgs; [

    (rWrapper.override {packages = rPkgs;})
    (rstudioWrapper.override {packages = rPkgs;})

  ];

}