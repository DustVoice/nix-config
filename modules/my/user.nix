{ __findFile, ... }:
{
  my.user.provides = {
    dustvoice = <den.lib.parametric> {
      includes = [
        <den/primary-user>
        (<den/user-shell> "fish")

        <dev/ai>
        <dev/cli-tui>
        <dev/direnv>
        <dev/editors>
        <dev/fonts>
        <dev/m3l>
        <dev/nix>
        <dev/prompts>
        # <dev/secrets>
        <dev/shells>
        <dev/terminals>
        <dev/typst>
        <dev/vcs>
      ];
    };
  };
}
