{
  dev.oh-my-posh.homeManager = {
    home.file.".config/oh-my-posh/config.yaml".source = ./dots/dustvoice.omp.yaml;
    
    programs.oh-my-posh = {
      enable = true;

      enableFishIntegration = true;
    };
  };
}
