{
  flake-file.inputs.jjui.url = "github:idursun/jjui";

  dev.jujutsu.homeManager =
    { pkgs, ... }:
    {
    home.packages = [
      pkgs.lazyjj
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
