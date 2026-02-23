let
  kicad.homeManager = {pkgs, ...}: {
    home.packages = [pkgs.kicad];
  };

  components.homeManager = {pkgs, ...}: {
    home.packages = [pkgs.easyeda2kicad];
  };
in {
  cad.kicad.includes = [
    kicad
    components
  ];
}
