{ den, ... }:
{
  # user aspect
  den.aspects.dustvoice = {
    includes = [
      den._.primary-user
      (den._.user-shell "fish")
      den.aspects.shell._.nushell
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
