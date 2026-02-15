# DO-NOT-EDIT. This file was auto-generated using github:vic/flake-file.
# Use `nix run .#write-flake` to regenerate it.
{

  outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } (inputs.import-tree ./modules);

  inputs = {
    claude-code.url = "github:sadjow/claude-code-nix";
    den.url = "github:vic/den";
    flake-aspects.url = "github:vic/flake-aspects";
    flake-file.url = "github:vic/flake-file";
    flake-parts = {
      inputs.nixpkgs-lib.follows = "nixpkgs-lib";
      url = "github:hercules-ci/flake-parts";
    };
    home-manager = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/home-manager";
    };
    import-tree.url = "github:vic/import-tree";
    jjdag = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:anthrofract/jjdag";
    };
    jjui = {
      inputs = {
        flake-parts.follows = "nixpkgs";
        nixpkgs.follows = "nixpkgs";
      };
      url = "github:idursun/jjui";
    };
    nixos-wsl = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/nixos-wsl";
    };
    nixpkgs.url = "https://channels.nixos.org/nixpkgs-unstable/nixexprs.tar.xz";
    nixpkgs-lib.follows = "nixpkgs";
    systems.url = "github:nix-systems/default";
  };

}
