# In ./hosts/vultr/default.nix
{ config, pkgs, modulesPath, lib, specialArgs, ... }: # Make sure specialArgs is received

let
  # Extract username from specialArgs passed by flake.nix
  username = specialArgs.username;
in
{
  imports = [
    # Standard import


    # Your hardware configuration
    ./hardware-configuration.nix

    # Explicitly import your system module and pass its required arguments
    (import ../../modules/system.nix {
      inherit pkgs lib username; # Pass pkgs, lib, and the extracted username
      # Add any other arguments modules/system.nix might require
    })

    # REVIEW: If ./users/${username}/nixos.nix also exists and imports system.nix,
    # or defines the user, you might have conflicts or double imports.
    # Ensure system.nix is imported only once and correctly passes 'username'.
    # If ./users/${username}/nixos.nix is just a wrapper, ensure it correctly
    # imports ../../modules/system.nix and passes the necessary args.
    # If unsure, temporarily remove ./users/${username}/nixos.nix from flake.nix's
    # modules list for the vultr host to isolate the issue to the import here.
  ];

  # Add other host-specific configurations here
  # Example: networking, services unique to this host, bootloader settings, etc.
  time.timeZone = "America/Denver";
  # system.stateVersion must be set here or in an imported module
  system.stateVersion = "24.11"; # Example, match your actual version
  wsl.defaultUser = lib.mkForce "shuai"; 
  # hostname can be set here
  networking.hostName = "wsl"; # Example

}
