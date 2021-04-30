with (import <nixpkgs> {});
let
  env = bundlerEnv {
    name = "bushpig-bundler-env";
    inherit ruby;
    gemfile  = ./Gemfile;
    lockfile = ./Gemfile.lock;
    gemset   = ./gemset.nix;
  };
in stdenv.mkDerivation {
  name = "bushpig";
  buildInputs = [ env ];
}
