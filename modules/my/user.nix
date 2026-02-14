{ __findFile, ... }:
{
  my.user.provides = {
    dustvoice = <den.lib.parametric> {
      includes = [
        <den/primary-user>
        (<den/user-shell> "fish")

        <dev/cli-tui>
        <dev/carapace>
        <dev/direnv>
        <dev/editors>
        <dev/fish>
        <dev/fonts>
        <dev/fzf>
        <dev/git>
        <dev/ghostty>
        <dev/helix>
        <dev/jujutsu>
        <dev/nushell>
        <dev/oh-my-posh>
        # <dev/secrets>
        <dev/terminals>
        <dev/zellij>
        <dev/zoxide>
      ];
    };
  };
}
