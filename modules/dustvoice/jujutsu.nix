{
  flake-file.inputs.jjui.url = "github:idursun/jjui";

  dustvoice.jujutsu.homeManager = {
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
