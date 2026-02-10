{
  dev.oh-my-posh.homeManager =
    { config, ... }:
    {
      home.file.".config/oh-my-posh/dustvoice.omp.yaml".source = ./dots/dustvoice.omp.yaml;
    
      programs.oh-my-posh = {
        enable = true;

        configFile = "${config.home.homeDirectory}/.config/oh-my-posh/dustvoice.omp.yaml";
      
        enableFishIntegration = true;
      };
    };
}
