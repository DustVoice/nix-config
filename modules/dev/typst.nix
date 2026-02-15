let
  helix-language.homeManager.programs.helix.languages.language = [
    {
      name = "typst";
      auto-format = true;
      formatter.command = "typstfmt";
    }
  ];
in {
  dev.typst.includes = [
    helix-language
  ];

  # Instead of installing a specific typst package,
  # I opt to use https://github.com/loqusion/typix
  # as to manage the typst dependency on the project level.
}
