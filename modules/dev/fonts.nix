let
  font-packages.nixos = {pkgs, ...}: {
    fonts.packages = with pkgs.nerd-fonts; [
      iosevka
      iosevka-term
      jetbrains-mono
    ];
  };

  program-configurations.homeManager = {
    programs.ghostty.settings = {
      font-family = "IosevkaTerm Nerd Font";
      font-size = 13.0;
    };
  };
in {
  dev.fonts.includes = [
    font-packages
    program-configurations
  ];
}
