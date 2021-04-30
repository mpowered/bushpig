{ stdenv, lib, bundlerEnv, ruby }:

let env = bundlerEnv {
  name = "bushpig-env";
  gemdir = ./.;
  inherit ruby;
};

in stdenv.mkDerivation {
  name = "bushpig";
  buildInputs = [ env.wrappedRuby ];
  script = ./bin/bushpig;
  buildCommand = ''
    install -D -m755 $script $out/bin/bushpig
    patchShebangs $out/bin/bushpig
  '';
}
