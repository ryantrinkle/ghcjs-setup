ghcjs-setup
===========

**NixOS users, please read the important note below before continuing**

To install, do this:

```bash
git clone https://github.com/ryantrinkle/ghcjs-setup
cd ghcjs-setup
./ghcjs-setup
```

This will install the Nix package manager, grab the ghcjs package information, build everything, then give you access to a sandbox with ghcjs and node.js available.  The first time you run it, the build process will take a long time - up to several hours.  After that, it should only take a few moments.

You will need sudo access in order to install Nix (unless you are on NixOS).  However, you should run the script as yourself, not root - it will prompt for your password when necessary.

### Note: Enabling the binary cache on NixOS

When using Nix on NixOS, only root can add binary caches to the system.  This will force ghcjs-setup to rebuild GHCJS from scratch, which takes hours.  To enable the binary cache, you can add the following line to your `/etc/nixos/configuration.nix`:

```
  nix.trustedBinaryCaches = [ "https://ryantrinkle.com:5443" ];
```

If you already have a trustedBinaryCaches option set up, just add `https://ryantrinkle.com:5443/` to the existing list.

Once it's been added, run `sudo -i nixos-rebuild switch` to make the change take effect, then run ghcjs-setup as normal.
