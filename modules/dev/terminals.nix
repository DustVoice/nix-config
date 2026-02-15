let
  ghostty.homeManager.programs.ghostty = {
    enable = true;

    settings = {
      theme = "Catppuccin Macchiato";

      confirm-close-surface = false;

      keybind = "performable:shift+insert=paste_from_clipboard";
    };
  };
in {
  dev.terminals.includes = [
    ghostty
  ];
}
