{
  den.default = {
    includes =
      let
        # Example: parametric host aspect to automatically set hostName on any host.
        set-host-name =
          { host, ... }:
          {
            ${host.class}.networking.hostName = host.name;
          };
      in
      [ set-host-name ];

    homeManager = {
      programs = {
        vim.enable = true;
      };
    };
  };
}
