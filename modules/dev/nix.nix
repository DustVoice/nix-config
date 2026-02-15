let
  alejandra.nixos = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.alejandra
    ];
  };

  helix-language.homeManager.programs.helix.languages.language = [{
    name = "nix";
    auto-format = true;
    formatter.command = "alejandra";
  }];

  nil.nixos = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.nil
    ];
  };
in {
  dev.nix.includes = [
    alejandra
    helix-language
    nil
  ];
}
