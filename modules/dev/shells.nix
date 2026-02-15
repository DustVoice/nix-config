let
  fish.homeManager.programs = {
    fish.enable = true;
    fzf.enableFishIntegration = true;
    ghostty.enableFishIntegration = true;
    oh-my-posh.enableFishIntegration = true;
    zoxide.enableFishIntegration = true;
  };

  nushell.homeManager.programs = {
    nushell = {
      enable = true;
    };

    carapace.enable = true;
    carapace.enableNushellIntegration = true;

    oh-my-posh.enableNushellIntegration = true;

    zoxide.enable = true;
    zoxide.enableNushellIntegration = true;
    zoxide.options = [ "--cmd cd" ];
  };
in
{
  dev.shells.includes = [
    fish
    nushell
  ];
}
