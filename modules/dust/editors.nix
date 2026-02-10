{
  dust.editors = {
    homeManager =
      { pkgs, ... }:
      {
        home.packages = [
          pkgs.vim
        ];
      };
  };
}
