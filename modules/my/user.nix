{ __findFile, ... }:
{
  my.user.provides = {
    dustvoice = <den.lib.parametric> {
      includes = [
        <den/primary-user>
        (<den/user-shell> "fish")

        <dev/cli-tui>
        <dev/direnv>
        <dev/editors>
        <dev/fish>
        <dev/git>
        <dev/ghostty>
        <dev/helix>
        <dev/jujutsu>
        <dev/nushell>
        # <dev/secrets>
        <dev/terminals>
      ];
    };
  };
}
