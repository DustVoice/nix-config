let
  fontPackages.nixos = { pkgs, ... }: {
    fonts.packages = with pkgs.nerd-fonts; [
      iosevka
      iosevka-term
      jetbrains-mono
    ];
  };
  
  programConfigurations.homeManager = {
    programs.ghostty.settings = {
      font-family = "IosevkaTerm Nerd Font";
      font-size = 13.0;
    };
  };
in
{
  dev.fonts.includes = [
    fontPackages
    programConfigurations
  ];
}
