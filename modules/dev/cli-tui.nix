{
  dev.cli-tui = {
    homeManager =
      { pkgs, ... }:
      {
        home.packages = [
          pkgs.bat
          pkgs.bottom
          pkgs.diffnav
          pkgs.eza
          pkgs.fd
          pkgs.fzf
          pkgs.htop
          pkgs.jq
          pkgs.ripgrep
        ];
      };
  };
}
