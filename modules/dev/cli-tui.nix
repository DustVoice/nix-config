{
  dev.cli-tui.homeManager = { pkgs, ... }: {
    programs.bat = {
      enable = true;
      config.theme = "Catppuccin Macchiato";
    };

    home.packages = with pkgs; [
      bottom
      diffnav
      eza
      fd
      htop
      jq
      ripgrep
    ];
  };
}
