{
  dev.editors = {
    homeManager =
      { pkgs, ... }:
      {
        home.packages = [
          pkgs.vim
        ];
      };
  };
}
