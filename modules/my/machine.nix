{ __findFile, inputs, ... }:
{
  
  flake-file.inputs = {
    nixos-wsl = {
      url = "github:nix-community/nixos-wsl";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  my.machine.provides = {
    base.nixos =
      { pkgs, ... }:
      {
        environment.systemPackages = [ pkgs.git pkgs.vim ];

        security.sudo-rs = {
          enable = true;
      	  wheelNeedsPassword = false;

          extraConfig = ''
            Defaults env_keep += "http_proxy"
            Defaults env_keep += "https_proxy"
            Defaults env_keep += "HTTP_PROXY"
            Defaults env_keep += "HTTPS_PROXY"
          '';
        };
      };

    wsl.nixos =
      { pkgs, ... }:
      {
        imports = [
          inputs.nixos-wsl.nixosModules.default
        ];

        wsl = {
          enable = true;
          startMenuLaunchers = true;
          usbip.enable = true;
          useWindowsDriver = true;
        };

        environment.systemPackages = [ pkgs.wsl-vpnkit ];
      };

    wsl-home.includes = [
      <my.machine/base>
      <my.machine/wsl>
    ];

    wsl-work-old.includes = [
      <my.machine/base>
      <my.machine/wsl>
    ];

    wsl-work = {
      includes = [
        <my.machine/base>
        <my.machine/wsl>
      ];
    };
  };
}
