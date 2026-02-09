{ __findFile, ... }:
{
  dustvoice.editors = {
    homeManager =
      { pkgs, ... }:
      {
        home.packages = [
          pkgs.vim
        ];
      };
  };
}
