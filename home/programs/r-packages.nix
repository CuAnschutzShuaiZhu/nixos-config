# r-packages.nix
{ pkgs }:

with pkgs.rPackages; [
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
]
