{
  flake-file.inputs.jjui.url = "github:idursun/jjui";

  dust.jujutsu.homeManager =
    { pkgs, ... }:
    {
    home.packages = [
      pkgs.lazyjj
      pkgs.jj-fzf
      pkgs.jjui
    ];

    programs.jujutsu = {
      enable = true;

      settings = {
        user.name = "DustVoice";
        user.email = "info@dustvoice.de";

        revsets.log = "default()";
      };
    };
  };
}
