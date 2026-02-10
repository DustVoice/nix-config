let
  dust.direnv.homeManager = {
    programs.direnv.enable = true;
    programs.direnv.nix-direnv.enable = true;
  };

in
{
  inherit dust;
}
