{
  my.nix-settings = {host, ...}: {
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
}
