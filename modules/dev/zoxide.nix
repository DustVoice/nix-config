{
  dev.zoxide.homeManager =
    {
      programs.fish.enable = true;
      programs.nushell.enable = true;
      
      programs.zoxide = {
        enable = true;

        enableFishIntegration = true;
        enableNushellIntegration = true;

        options = [
          "--cmd cd"
        ];
      };
    };
}
