let nixpkgs = import ./nixpkgs {config.allowUnfree = true;};
in rec {
  inherit nixpkgs;
  ghc = nixpkgs.pkgs.haskell-ng.packages.ghc7101;
  ghcjs = nixpkgs.pkgs.haskell-ng.packages.ghcjs;
  platforms = [ "ghcjs" ] ++ (if !nixpkgs.stdenv.isDarwin then [ "ghc" ] else []);
}
