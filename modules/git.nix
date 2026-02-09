{
  den.aspects.git.homeManager = {
    home.packages = [ ];

    programs.git = {
      enable = true;

      settings = {
        init.defaultBranch = "main";
      };
    };
  };

  den.aspects.dustvoice.homeManager = {
    programs.git = {
      settings = {
        user = {
          name = "DustVoice";
          email = "info@dustvoice.de";
        };
      };
    };       
  };
}
