{
  dev.editors = {
    homeManager = {
      programs.helix = {
        enable = true;
        defaultEditor = true;
        settings.theme = "catppuccin_macchiato";
      };
    };

    nixos = { pkgs, ... }: {
      environment.systemPackages = with pkgs; [
        helix
        neovim
      ];
    };
  };
}
