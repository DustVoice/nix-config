{ __findFile, inputs, ... }:
{
  
  flake-file.inputs = {
    nixos-wsl = {
      url = "github:nix-community/nixos-wsl";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  my.device.provides = {
    base.includes = [
      <nix-config/system>
    ];

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
