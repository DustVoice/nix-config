{
  dev.devenv.homeManager = {pkgs, ...}: {
    home.packages = with pkgs; [
      devenv
    ];
  };
}
