{ __findFile, inputs, pkgs, ... }:
{
  
  flake-file.inputs = {
    nixos-wsl = {
      url = "github:nix-community/nixos-wsl";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  my.device.provides = {
    base = {
      nixos.environment.systemPackages = [ pkgs.git pkgs.vim ];
    };

    wsl.nixos = {
      imports = [
        inputs.nixos-wsl.nixosModules.default
      ];

      wsl.enable = true;
    };

    wsl-home.includes = [
      <my.device/wsl>
      <my.device/base>
    ];

  };
}
