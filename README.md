# DustVoice's Nix(OS) & Home-Manager config

This is my [dendritic](https://dendrix.oeiuwq.com/Dendritic.html) Nix(OS) & Home-Manager configuration.
_Nix besonderes!_

It utilizes [Den](), a framework for:
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
