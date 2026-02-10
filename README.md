# DustVoice's Nix(OS) & Home-Manager config

This is my [dendritic](https://dendrix.oeiuwq.com/Dendritic.html) Nix(OS) & Home-Manager configuration.
_Nix besonderes!_

It utilizes framework called [Den](https://github.com/vic/den):
> Modular, context-aware and aspect-oriented dendritic Nix configurations

After getting familiar with the dendritic approach compared to a more "traditional" flake setup
(e.g., [EmergentMind's config](https://github.com/EmergentMind/nix-config)),
I settled on a layout **heavily** inspired by [vic](https://github.com/vic)'s [own config](https://github.com/vic/vix).

It is definitely not something for the faint of heart and if you're unfamiliar with Nix in general,
the syntax, or even just flakes, I'd recommend a simpler approach at first.

## Bootstrap on NixOS

To bootstrap a (predefined!) device, simply use

```console
sudo nixos-rebuild switch --flake github:DustVoice/nix-config#hostname
```

where `hostname` corresponds to a hostname defined in `modules/my/hosts.nix`.

### WSL

As I normally use my own username instead of the default `nixos` user used by the NixOS-WSL image,
special care is needed when bootstrapping (and therefore changing the default user) on WSL.

According to the [NixOS-WSL documentation](https://nix-community.github.io/NixOS-WSL/how-to/change-username.html),
you'd need to

1. Rebuild the `boot` instead of directly `switch`ing to it

   ```console
   sudo nixos-rebuild boot --flake github:DustVoice/nix-config#hostname
   ```
2. Exit the WSL shell and terminate the distro

   ```ps
   wsl.exe -t NixOS
   ```
3. Start a shell as the `root` user and immediately exit, applying the new generation

   ```ps
   wsl.exe -d NixOS --user root exit
   ```
4. Stop the distro again

   ```ps
   wsl.exe -t NixOS
   ```
5. Finally open a WSL shell with (hopefully) everything applied.

   **NOTE:** This doesn't transfer any files from the
   `nixos` user's home directory to the newly created user!

### Proxy

When bootstrapping behind a proxy, some intermediate steps become necessary.
Although the correct proxy configuration should be present for the specific hostname,
bootstrapping the system for the first time requires some temporary environment modifications:

```console
proxy_url="http://user:password@proxy:port/"
export http_proxy="$proxy_url"
export https_proxy="$proxy_url"
export HTTP_PROXY="$proxy_url"
export HTTPS_PROXY="$proxy_url"
export CURL_NIX_FLAGS="-x $proxy_url"
```

Unfortunately there is only a limited set of environment variables which get copied over by `sudo`!
This might be wise from a security standpoint but is annoying in this case.
To circumvent this, add `--preserve-env=http_proxy,https_proxy,HTTP_PROXY,HTTPS_PROXY` as an argument to sudo:

```console
sudo --preserve-env=http_proxy,https_proxy,HTTP_PROXY,HTTPS_PROXY,CURL_NIX_FLAGS nixos-rebuild switch --flake github:DustVoice/nix-config#hostname
```

## Bootstrap on Generic Linux

To utilize the standalone home-manager configurations defined in `modules/my/hosts.nix` on non-NixOS systems:

1. First [install Nix (the Package Manager)](https://nixos.org/download)
2. Then install home-manager
   
   ```console
   nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
   nix-channel --update
   ```
4. Then build and run the home-manager configuration
   
   ```console
   home-manager --extra-experimental-features "nix-command flakes" --flake github:DustVoice/nix-config#username switch
   ```

   where `username` corresponds to a username for which a standalone home-manager config has been defined in `modules/my/hosts.nix`
