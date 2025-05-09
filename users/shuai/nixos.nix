{
  ##################################################################################################################
  #
  # NixOS Configuration
  #
  ##################################################################################################################

  users.users.shuai = {
    # shuai's authorizedKeys
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHFRYKawL/M97qcOuMRWAWc67lp30Ru2Sk5au/ViOjkD zhu-s@DESKTOP-K1FDJ82"
    ];
    # shuai's password
    
  };
}