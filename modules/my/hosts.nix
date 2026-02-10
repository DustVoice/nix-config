{ __findFile, ... }:
{
  den.hosts.x86_64-linux = {
    wsl-home = {
      description = "WSL on my home machine";
      wsl = { };
      
      users = {
        dustvoice = { };
      };
    };
  };

  # define an standalone home-manager for dustvoice
  den.homes.x86_64-linux.dustvoice = { };
  
  den.aspects = {
    dustvoice.includes = [ <my/user/dustvoice> ];

    wsl-home.includes = [ <my/device/wsl-home> ];
  };
}
