let
  fish.homeManager.programs = {
    fish.enable = true;
    fzf.enableFishIntegration = true;
    ghostty.enableFishIntegration = true;
    oh-my-posh.enableFishIntegration = true;
    zoxide.enableFishIntegration = true;
  };
  fish.homeManager.services.gpg-agent.enableFishIntegration = true;

  nushell.homeManager.programs = {
    # Dependencies
    carapace.enable = true;
    carapace.enableNushellIntegration = true;

    helix.enable = true;

    oh-my-posh.enableNushellIntegration = true;

    zoxide.enable = true;
    zoxide.enableNushellIntegration = true;
    zoxide.options = ["--cmd cd"];

    # Main Program
    nushell = {
      enable = true;

      settings = {
        config = {
          buffer_editor = "hx";
          cursor_shape = {
            emacs = "line";
            vi_insert = "line";
            vi_normal = "block";
          };
          edit_mode = "vi";
        };
      };

      shellAliases = {
        ll = "ls -l";
      };
    };
  };
  nushell.homeManager.services.gpg-agent.enableNushellIntegration = true;
in {
  dev.shells.includes = [
    fish
    nushell
  ];
}
