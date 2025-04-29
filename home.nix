{ config, pkgs, ... }:
let
  rPkgs = import ./r-packages.nix { inherit pkgs; };
in
{
  # username and home directory
  home.username = "shuai";
  home.homeDirectory = "/home/shuai";

  home.packages = with pkgs;[
    git
    neofetch # display system information
    btop  # replacement of htop/nmon
    lsof # list open files
    python313 
    tmux # terminal multiplexer
    dust # Disk Usage/Free Utility
    tldr
		(rWrapper.override {packages = rPkgs;})
    (rstudioWrapper.override {packages = rPkgs;})
    just # Handy way to save and run project-specific commands
    rustc cargo # rust env
  ];

  # git 
  programs.git = {
    enable = true;
    userName = "CuAnschutzShuaiZhu";
    userEmail = "shuai.zhu@cuanschutz.edu";
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
