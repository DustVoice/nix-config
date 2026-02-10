let
  dev.direnv.homeManager = {
    programs.direnv.enable = true;
    programs.direnv.nix-direnv.enable = true;
  };

in
{
  inherit dev;
}
