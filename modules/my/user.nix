{__findFile, ...}: {
  my.user.provides = {
    dustvoice = <den.lib.parametric> {
      includes = [
        <den/primary-user>
        (<nix-config/user-shell> "nushell")

        <dev/ai>
        <dev/cli-tui>
        <dev/direnv>
        <dev/editors>
        <dev/fonts>
        <dev/langs>
        <dev/nh>
        <dev/prompts>
        <dev/secrets>
        <dev/shells>
        <dev/smartcard>
        <dev/ssh>
        <dev/terminals>
        <dev/vcs>

        <cad/kicad>
        <cad/openscad>
      ];
    };
  };
}
