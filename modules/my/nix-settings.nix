let
  secrets = {
    homeManager = {config, ...}: {
      nix.extra-options = ''
        !include ${config.sops.secrets.nix_access_tokens.path}
      '';
    };
  };

  nix-settings = {host, ...}: {
    nixos.nix = {
      optimise.automatic = true;

      settings = {
        experimental-features = [
          "nix-command"
          "flakes"
        ];

        trusted-users = [
          "root"
          "@wheel"
        ];
      };
    };
  };
in {
  my.nix-settings.includes = [
    nix-settings
    secrets
  ];
}
