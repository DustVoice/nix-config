{
  __findFile,
  inputs,
  ...
}: let
  flake-file.inputs.sops-nix.url = "github:Mic92/sops-nix";

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

  age.homeManager = {pkgs, ...}: {
    home.packages = [pkgs.age];
  };

  api-keys.homeManager = {config, ...}: {
    sops = {
      secrets = {
        "anthropic_api_key" = {};
      };

      templates = {
        "llm_apis.env".content = ''
          export ANTHROPIC_API_KEY="${config.sops.placeholder.anthropic_api_key}"
        '';
      };
    };
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
  inherit flake-file;

  dev.secrets = <den.lib.parametric> {
    includes = [
      ({user, ...}: sops-nix)
      ({home, ...}: sops-nix)
      age
      api-keys
    ];
  };
}
