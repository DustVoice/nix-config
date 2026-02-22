{
  dev.direnv.homeManager = {
    programs.direnv.enable = true;
    programs.direnv.nix-direnv.enable = true;

    home.sessionPath = ["$HOME/.local/bin"];
  };
}
