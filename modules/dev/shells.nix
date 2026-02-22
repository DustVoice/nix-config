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

  # NOTE: This is needed for the Windows Terminal app to respect colors;
  nushell-colorterm.homeManager.programs = {
    nushell.extraEnv = ''
      $env.COLORTERM = "truecolor";
    '';
  };

  nom.homeManager = {pkgs, ...}: {
    home.packages = with pkgs; [
      nix-output-monitor
    ];
  };
in {
  dev.shells.includes = [
    fish

    nushell
    nushell-plugins
    nushell-colorterm

    nom
  ];
}
