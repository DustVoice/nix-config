let
  tombi.homeManager = {pkgs, ...}: {
    home.packages = [pkgs.tombi];
  };
  helix-languages.homeManager.programs.helix.languages.language = [
    {
      name = "toml";
      auto-format = true;
      formatter.command = "tombi format";
    }
  ];
in {
  dev.langs.provides.toml.includes = [
    tombi
    helix-languages
  ];
}
