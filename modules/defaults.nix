{__findFile, ...}: {
  den.ctx.default = {
    nixos.system.stateVersion = "25.05";
    homeManager.home.stateVersion = "25.05";

    includes = [
      <den/define-user>
    ];
  };

  den.ctx.host.includes = [
    <nix-config/hostname>
    <my/nix-settings>
  ];
}
