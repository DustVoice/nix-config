{
  dev.terminals.homeManager = { pkgs, ... }: {
    home.packages = with pkgs; [
      alacritty
      wezterm
    ];
  };
}
