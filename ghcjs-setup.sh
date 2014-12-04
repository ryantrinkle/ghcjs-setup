#!/usr/bin/env bash
set -eu

trap "echo 'It looks like a problem occurred.  Please submit an issue at https://github.com/ryantrinkle/ghcjs-setup/issues'; exit 1" ERR

echo "If you have any trouble with this script, please submit an issue at https://github.com/ryantrinkle/ghcjs-setup/issues"

if [ ! -d /nix ] ; then
  if ! type -P curl ; then
    echo "Please make sure that 'curl' is installed and can be run from this shell"
    exit 1
  fi

  echo "Installing Nix"
  bash <(curl https://nixos.org/nix/install)
fi

if ! type -P nix-shell ; then
  . ~/.nix-profile/etc/profile.d/nix.sh
fi

if [ ! -d nixpkgs ] ; then
  if ! type -P git ; then
    echo "Please make sure that 'git' is installed and can be run from this shell"
    exit 1
  fi

  echo "Getting ghcjs build scripts"
  git clone https://github.com/ryantrinkle/nixpkgs
fi

INFO=$(cat <<"EOF"

You are now in a shell with access to ghcjs and cabal-js.  You can verify that ghcjs is configured correctly with:
$ ghcjs --version
The Glorious Glasgow Haskell Compilation System for JavaScript, version 0.1.0 (GHC 7.8.3)

$ cabal-js install --help | grep ghcjs
--ghcjs                         compile with GHCJS

To build a basic program with ghcjs, do:
$ echo 'main = putStrLn \"Hello, world!\"' > helloWorld.hs
$ ghcjs helloWorld.hs
$ node helloWorld.jsexe/all.js
EOF
)

echo "Entering the ghcjs/nodejs sandbox; this may take several hours the first time you run it"
nix-shell -I . -p haskellPackages_ghcjs.ghc haskellPackages_ghcjs.ghc.ghc.parent.cabalInstallGhcjs nodejs --command "echo \"$INFO\" ; return"
