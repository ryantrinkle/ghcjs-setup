ghcjs-setup
===========

## NixOS users only:

Add https://ryantrinkle.com:5443 to trustedBinaryCaches in your /etc/nixos/configuration.nix

```bash
sudo nixos-rebuild switch
```
## Everyone:

```bash
git clone https://github.com/ryantrinkle/ghcjs-setup
cd ghcjs-setup
./ghcjs-setup
```

This will install the Nix package manager, grab the ghcjs package information, build everything, then give you access to a sandbox with ghcjs and node.js available.  The first time you run it, the build process will take a long time - up to several hours.  After that, it should only take a few moments.

You will need sudo access in order to install Nix (unless you are on NixOS).  However, you should run the script as yourself, not root - it will prompt for your password when necessary.
