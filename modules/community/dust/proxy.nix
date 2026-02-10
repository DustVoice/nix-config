{ den, ... }:
let
  description = ''
    Sets a system wide proxy.

    ## Usage

    (<dust/proxy> proxy noProxy)

    where

    - `proxy` is the proxy server in the form of `"http://user:password@proxy:port/"`
    - `noProxy` are the proxy exceptions, `"127.0.0.1,localhost,internal.domain"` by default
  '';
in
{
  dust.proxy =
    { proxy, noProxy ? "127.0.0.1,localhost,internal.domain" }:
    {
      inherit description;

      nixos = {
        networking.proxy.default = proxy;
        networking.proxy.noProxy = noProxy;
      };
    };
}
