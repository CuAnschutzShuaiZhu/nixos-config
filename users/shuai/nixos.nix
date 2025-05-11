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
    hashedPassword = 'df5a24cbc08e7d651a6b65833238006b073f1182defa586a0365ed7ec442b0c319ffa45e5f7d12b90926788f0682098706a04aa51539ec70a384c3e41958c22c';
  };
}