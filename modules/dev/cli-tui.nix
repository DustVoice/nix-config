let
  bat.homeManager = {
    programs.bat = {
      enable = true;
      config.theme = "Catppuccin Macchiato";
    };    
  };

  zellij.homeManager = {
    programs.zellij = {
      enable = true;
      settings.theme = "catppuccin-macchiato";
    };
  };

  otherPackages.homeManager = { pkgs, ... }: {
    home.packages =  with pkgs; [
      bottom
      diffnav
      eza
      fd
      htop
      jq
      ripgrep
    ];
  };
in
{
  dev.cli-tui.includes = [
    bat
    zellij  
    otherPackages
  ];
}
