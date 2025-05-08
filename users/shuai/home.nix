{pkgs, ...}: {
  ##################################################################################################################
  #
  # All Ryan's Home Manager Configuration
  #
  ##################################################################################################################

  imports = [
    ../../home/core.nix

  ];

  programs.git = {
    enable = true;
    userName = "CuAnschutzShuaiZhu";
    userEmail = "shuai.zhu@cuanschutz.edu";
  };
}