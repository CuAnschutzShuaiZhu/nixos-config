{pkgs, ...}: 

{

  imports = [
    ../../home/core.nix
    ../../home/programs

  ];

  programs.git = {
    enable = true;
    userName = "CuAnschutzShuaiZhu";
    userEmail = "shuai.zhu@cuanschutz.edu";
  };
}