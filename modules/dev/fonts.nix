{
  dev.fonts = {
    nixos = { pkgs, ... }: {
      fonts.packages = with pkgs.nerd-fonts; [
        iosevka
        iosevka-term
        jetbrains-mono
      ];
    };

    homeManager = {
      programs.ghostty.settings = {
        font-family = "IosevkaTerm Nerd Font";
        font-size = 13.0;
      };
    };
  };
}
