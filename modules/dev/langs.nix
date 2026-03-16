{__findFile, ...}: {
  dev.langs = {
    includes = [
      <dev/langs/clojure>
      <dev/langs/m3l>
      <dev/langs/nix>
      <dev/langs/toml>
      <dev/langs/typst>
    ];

    provides = {
      clojure.homeManager = {pkgs, ...}: {home.packages = [pkgs.babashka];};
      m3l = {};
      nix = {};
      toml = {};
      typst = {};
    };
  };
}
