# defines all hosts + users + homes.
# then config their aspects in as many files you want
{
  # dustvoice user at wsl-home host.
  den.hosts.x86_64-linux = {
    wsl-home = {
      description = "WSL on my home machine";
      users.dustvoice = { };

      wsl = { };
    };
  };

  # define an standalone home-manager for dustvoice
  den.homes.x86_64-linux.dustvoice = { };

  flake-file.inputs = {
    nixos-wsl = {
      url = "github:nix-community/nixos-wsl";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-compat.follows = "";
    };
  };
}
