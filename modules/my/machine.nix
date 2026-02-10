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
      };

    wsl.nixos = {
      imports = [
        inputs.nixos-wsl.nixosModules.default
      ];

      wsl = {
        enable = true;
        startMenuLaunchers = true;
        usbip.enable = true;
        useWindowsDriver = true;
      };
    };

    wsl-home.includes = [
      <my.machine/base>
      <my.machine/wsl>
    ];

    wsl-work.includes = [
      <my.machine/base>
      <my.machine/wsl>
      (<nix-config/proxy>
        {
          proxy = "http://ldiproxy.lsjv.rlp.de:8080";
          noProxy = "vsvr-*;svr-*;nas-*;web-ko-*;lsjvko*;lsjvmz*;www.lsjv.rlp;www-sps.lsjv.rlp;klr.lsjv.rlp;mdtm.lsjv.rlp;bibliothek.lsjv.rlp;10.5.*;localhost;127.0.0.1;*-ldi.rlp.de;webmail.lsjv.rlp.de;webmail.lsjv.de;autodiscover.lsjv.rlp.de;tickets.lsjv.rlp.de;i-doit.lsjv.rlp.de;citrix.lsjv.rlp.de;director.lsjv.rlp.de;eudragmdp.eudra.org;ecdm.eudra.org;openproject.lsjv.rlp;login.lsjv.de";
        }
      )
    ];
  };
}
