{
  dev.editors.homeManager = { pkgs, ... }: {
    home.packages = with pkgs; [
      vim
    ];
  };
}
