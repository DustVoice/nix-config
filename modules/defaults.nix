{ den, pkgs, config, ... }:
{
  den.default = {
    nixos = {
      nix = {
        settings = {
          experimental-features = ["nix-command" "flakes"];
          trusted-users = [
            "root"
            "@wheel"
          ];
        };

        gc = pkgs.lib.optionalAttrs config.nix.enable {
          automatic = true;
          options = "--delete-older-than 7d";
        };
      };
    };
  };


  den.default.includes = [
    den._.home-manager
    den._.define-user

    (den.lib.take.exactly (
      { OS, host }:
      den.lib.take.unused OS {
        ${host.class}.networking.hostName = host.hostName;
      }
    ))

    {
      nixos.system.stateVersion = "25.05";
      homeManager.home.stateVersion = "25.05";
    }
  ];
}
