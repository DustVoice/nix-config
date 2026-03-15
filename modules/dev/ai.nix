{
  __findFile,
  inputs,
  ...
}: let
  flake-file.inputs.claude-code.url = "github:sadjow/claude-code-nix";

  secrets.homeManager = {config, ...}: {
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

  claude-code = variant:
    <den.lib.parametric> {
      includes = [
        ({user, ...}:
          <den/unfree> [
            variant
          ])

        ({home, ...}:
          <den/unfree> [
            variant
          ])
      ];

      nixos.nix.settings = {
        substituters = ["https://claude-code.cachix.org"];
        trusted-public-keys = ["claude-code.cachix.org-1:YeXf2aNu7UTX8Vwrze0za1WEDS+4DuI2kVeWEE4fsRk="];
      };

      homeManager = {pkgs, ...}: {
        nixpkgs.overlays = [inputs.claude-code.overlays.default];
        home.packages = [pkgs.${variant}];
        home.shellAliases = {
          claude =
            {
              "claude-code" = "claude";
              "claude-code-bun" = "claude-bun";
              "claude-code-node" = "claude-node";
            }.${
              variant
            };
        };
      };
    };

  helix-assist.homeManager.programs.helix.languages = {
    language-server.helix-assist = {
      command = "helix-assist";
      args = ["--handler" "anthropic" "--num-suggestions" "2"];
    };
  };
in {
  inherit flake-file;

  dev.ai = <den.lib.parametric> {
    includes = [
      (claude-code "claude-code-bun")
      helix-assist
      secrets
    ];
  };
}
