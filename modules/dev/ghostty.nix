{ lib, ... }: {
  dev.ghostty.homeManager = { config, ... }: {
    programs.ghostty = {
      enable = true;

      enableFishIntegration = lib.mkIf config.programs.fish.enable true;

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
