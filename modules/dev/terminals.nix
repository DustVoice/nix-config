{
  dev.terminals.homeManager = {
    programs.ghostty = {
      enable = true;

      settings = {
        theme = "Catppuccin Macchiato";

        confirm-close-surface = false;

        keybind = "performable:shift+insert=paste_from_clipboard";
      };
    };
  };
}
