{
  dev.git.homeManager = {
    programs.git = {
      enable = true;
      settings = {
        user.name = "DustVoice";
        user.email  = "info@dustvoice.de";

        init.defaultBranch = "main";
      };
    };
  };
}
