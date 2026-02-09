{ den, ... }:
{
  # user aspect
  den.aspects.dustvoice = {
    includes = [
      den._.primary-user
      den.aspects.nushell
      (den._.user-shell "nushell")
    ];

    homeManager =
      { pkgs, ... }:
      {
        home.packages = [
          pkgs.helix
        ];
      };

    # user can provide NixOS configurations
    # to any host it is included on
    # nixos = { pkgs, ... }: { };
  };
}
