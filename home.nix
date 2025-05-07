{
  config,
  pkgs,
  ...
}: let
  rPkgs = import ./r-packages.nix {inherit pkgs;};
in {
  # username and home directory
  home.username = "shuai";
  home.homeDirectory = "/home/shuai";

  home.packages = with pkgs; [
    git
    neofetch # display system information
    btop # replacement of htop/nmon
    lsof # list open files
    #(python312.withPackages (python-pkgs: with python-pkgs; [pandas numpy requests openpyxl numpy plotly notebook statsmodels scikitlearn])) # python 3.12
    uv # A command-line tool for creating and managing virtual environments
    tmux # terminal multiplexer
    dust # Disk Usage/Free Utility
    tldr
    (rWrapper.override {packages = rPkgs;})
    (rstudioWrapper.override {packages = rPkgs;})
    # pythonPackages.pythonEnv
    just # Handy way to save and run project-specific commands
    rustc
    cargo # rust env
    gcc13 # gcc 13
    gdb # GNU Debugger
    rclone # Command line program to sync files and directories to and from major cloud storage
    pandoc # universal markup converter
    
  ];

  # git
  programs.git = {
    enable = true;
    userName = "CuAnschutzShuaiZhu";
    userEmail = "shuai.zhu@cuanschutz.edu";
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      ll = "ls -l";
      edit = "sudo -e";
      update = "sudo nixos-rebuild switch";
    };
    history.size = 10000;
    history.ignoreAllDups = true;
    history.path = "$HOME/.zsh_history";
    history.ignorePatterns = ["rm *" "pkill *" "cp *"];
    initExtra = ''
      bindkey "^[[1;5C" forward-word
      bindkey "^[[1;5D" backward-word
      bindkey '5~' kill-word
    '';
  };

  programs.starship = {
    enable = true;
    settings = pkgs.lib.importTOML ./starship.toml;
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
