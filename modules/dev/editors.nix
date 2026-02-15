let
  helix = {
    homeManager.programs.helix = {
      enable = true;
      defaultEditor = true;
      settings.theme = "catppuccin_macchiato";
    };
  };

  neovim.nixos.programs.neovim.enable = true;
in
{
  dev.editors.includes = [
    helix
    neovim
  ];
}
