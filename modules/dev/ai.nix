{
  __findFile,
  inputs,
  ...
}: let
  flake-file.inputs.claude-code.url = "github:sadjow/claude-code-nix";

  claude-code = {
    # includes = [
    #   (<den/unfree> [
    #     "claude-code"
    #     "claude-code-node"
    #     "claude-code-bun"
    #   ])
    # ];

    nixos.nix.settings = {
      substituters = ["https://claude-code.cachix.org"];
      trusted-public-keys = ["claude-code.cachix.org-1:YeXf2aNu7UTX8Vwrze0za1WEDS+4DuI2kVeWEE4fsRk="];
    };

    # nixos = {
    #   imports = [
    #     inputs.claude-code.overlays.default
    #   ];
    # };

    homeManager = {pkgs, ...}: {
      # home.packages = [pkgs.claude-code-bun];
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

  dev.ai.includes = [
    claude-code
    helix-assist
  ];
}
