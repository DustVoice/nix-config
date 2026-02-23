{__findFile, ...}: {
  dev.langs = {
    includes = [
      <dev/langs/m3l>
      <dev/langs/nix>
      <dev/langs/toml>
      <dev/langs/typst>
    ];

    provides = {
      m3l = {};
      nix = {};
      toml = {};
      typst = {};
    };
  };
}
