{
  dev.cli-tui.homeManager = { pkgs, ... }: {
    programs.bat = {
      enable = true;
      config.theme = "Catppuccin Macchiato";
    };

    programs.zellij = {
      enable = true;
      settings.theme = "catppuccin-macchiato";
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
