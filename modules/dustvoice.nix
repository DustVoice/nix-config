{ den, ... }:
{
  # user aspect
  den.aspects.dustvoice = {
    includes = [
      den._.primary-user
      (den._.user-shell "nushell")
    ];

    homeManager =
      { pkgs, ... }:
      {
        home.packages = [ pkgs.helix ];

        programs.git = {
          enable = true;
          settings = {
            user = {
              name = "DustVoice";
              email = "info@dustvoice.de";
            };

            init.defaultBranch = "main";
          };
        };       
      };

    # user can provide NixOS configurations
    # to any host it is included on
    # nixos = { pkgs, ... }: { };
  };
}
