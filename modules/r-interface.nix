{
  lib,
  pkgs,
  ...
}: let
  rPkgs = with pkgs.rPackages; [
  tidyverse
  openxlsx
  mclust
  table1
  pROC
  cutpointr
  caret
  gridExtra
  rjags
  coda
  bayesrules
  kableExtra
  flextable
  rticles
];
in {
  environment.systemPackages = with pkgs; [

    (rWrapper.override {packages = rPkgs;})
    (rstudioWrapper.override {packages = rPkgs;})

  ];

}