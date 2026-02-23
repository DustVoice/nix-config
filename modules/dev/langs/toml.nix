{
  dev.langs.provides.toml.homeManager = {pkgs, ...}: {
    home.packages = [pkgs.tombi];
  };
}
