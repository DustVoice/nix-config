{
  den,
  inputs,
  ...
}: {
  den.default.includes = [
    den.aspects.hm
    den._.inputs'
    den._.self'
  ];

  den.aspects.hm.homeManager = {pkgs, ...}: {
    home.packages = [
      inputs.home-manager.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
  };
}
