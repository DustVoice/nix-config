let
  my.nix-settings = {
    nixos = nix-settings;
  };

  nix-settings =
    { pkgs, config, ... }:
      {
        nix = {
          optimise.automatic = true;

          settings = {
            experimental-features = [
              "nix-command"
              "flakes"
              # "allow-import-from-derivation"
            ];

            trusted-users = [
              "root"
              "@wheel"
            ];
          };

          gc = pkgs.lib.optionalAttrs config.nix.enable {
            automatic = true;
            # interval = "weekly"; # TODO!
            options = "--delete-older-than 7d";
          };
        };
      };
  in
  {
    inherit my;
  }
