{
  dev.fonts.nixos = { pkgs, ... }: {
    fonts.packages = with pkgs.nerd-fonts; [
      iosevka
      iosevka-term
      jetbrains-mono
    ];
  };
}
