{
  __findFile,
  inputs,
  ...
}: let
  sops-nix.homeManager = {
    config,
    pkgs,
    ...
  }: {
    imports = [
      inputs.sops-nix.homeManagerModules.sops
    ];

    home.packages = [pkgs.sops];

    sops = {
      defaultSopsFile = ./secrets.yaml;
      validateSopsFiles = true;
      gnupg.home = "${config.home.homeDirectory}/.gnupg";
    };
  };

  github-token = {user, ...}: {
    homeManager = {config, ...}: {
      sops.secrets.nix_access_tokens.owner = user.userName;
    };
  };

  age.homeManager = {pkgs, ...}: {
    home.packages = [pkgs.age];
  };

  yubikey-ssh-keys.homeManager = {config}: {
    sops.secrets = {
      "ssh/yk5-dustdev" = {
        format = "binary";
        sopsFile = ./secrets/yk5-dustdev;
      };
      "ssh/yk5n-dustdev" = {
        format = "binary";
        sopsFile = ./secrets/yk5n-dustdev;
      };
      "ssh/yk5c-dustdev" = {
        format = "binary";
        sopsFile = ./secrets/yk5c-dustdev;
      };
      "ssh/yk5-dustdev-root" = {
        format = "binary";
        sopsFile = ./secrets/yk5-dustdev-root;
      };
      "ssh/yk5n-dustdev-root" = {
        format = "binary";
        sopsFile = ./secrets/yk5n-dustdev-root;
      };
      "ssh/yk5c-dustdev-root" = {
        format = "binary";
        sopsFile = ./secrets/yk5c-dustdev-root;
      };
    };
  };
in {
  dev.secrets = <den.lib.parametric> {
    includes = [
      ({user, ...}: sops-nix)
      ({home, ...}: sops-nix)
      age

      ({user, ...}: github-token)
    ];
  };
}
