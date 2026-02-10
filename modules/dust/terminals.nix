{
  dust.terminals.homeManager =
    { pkgs, ... }:
    {
      home.packages = [
        pkgs.alacritty
        pkgs.wezterm
      ];
    };
}
