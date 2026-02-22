let
  fish.homeManager.programs = {
    fish.enable = true;
    fzf.enableFishIntegration = true;
    ghostty.enableFishIntegration = true;
    nix-your-shell.enableFishIntegration = true;
    oh-my-posh.enableFishIntegration = true;
    zoxide.enableFishIntegration = true;
  };
  fish.homeManager.services.gpg-agent.enableFishIntegration = true;

  nushell.homeManager.programs = {
    # Dependencies
    carapace.enable = true;
    carapace.enableNushellIntegration = true;

    helix.enable = true;

    nix-your-shell.enableNushellIntegration = true;

    oh-my-posh.enableNushellIntegration = true;

    zoxide.enable = true;
    zoxide.enableNushellIntegration = true;
    zoxide.options = ["--cmd cd"];

    # Main Program
    nushell = {
      enable = true;

      settings = {
        buffer_editor = "hx";
        cursor_shape = {
          emacs = "line";
          vi_insert = "line";
          vi_normal = "block";
        };
        edit_mode = "vi";
      };

      shellAliases = {
        ll = "ls -l";
      };
    };
  };
  nushell.homeManager.services.gpg-agent.enableNushellIntegration = true;

  nushell-plugins.homeManager = {pkgs, ...}: {
    programs.nushell.plugins = with pkgs.nushellPlugins; [
      formats
      highlight
      polars
      query
    ];
  };

  nix-your-shell.homeManager.programs.nix-your-shell = {
    enable = true;
    nix-output-monitor.enable = true;
  };
in {
  dev.shells.includes = [
    fish

    nushell
    nushell-plugins

    nix-your-shell
  ];
}
