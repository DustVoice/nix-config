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
        <dev/fonts>
        <dev/prompts>
        # <dev/secrets>
        <dev/shells>
        <dev/terminals>
        <dev/vcs>
      ];
    };
  };
}
