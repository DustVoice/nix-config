let
  kicad.homeManager = {pkgs, ...}: {
    home.packages = [pkgs.kicad];
    home.sessionVariables = {
      KICAD_SYMBOL_DIR = "${pkgs.kicad.libraries.symbols}/share/kicad/symbols";
    };
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
