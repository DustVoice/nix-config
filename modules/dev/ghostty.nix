{
  dev.ghostty.homeManager = {
    programs.ghostty = {
      enable = true;

      enableFishIntegration = true;

      settings = {
        theme = "Catppuccin Macchiato";

        font-family = "IosevkaTerm Nerd Font";
        font-size = 13.0;

        confirm-close-surface = false;

        keybind = "performable:shift+insert=paste_from_clipboard";
      };
    };
  };
}
