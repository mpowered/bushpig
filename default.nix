{ stdenv, bundlerEnv, ruby }:
let
  # the magic which will include gemset.nix
  gems = bundlerEnv {
    name = "bushpig";
    inherit ruby;
    gemdir  = ./.;
  };
in stdenv.mkDerivation {
  name = "bushpig";
  src = ./.;
  buildInputs = [gems ruby];
  installPhase = ''
    mkdir -p $out/{bin,share/bushpig}
    cp -r * $out/share/bushpig
    bin=$out/bin/bushpig
# we are using bundle exec to start in the bundled environment
    cat > $bin <<EOF
#!/bin/sh -e
exec ${gems}/bin/bundle exec ${ruby}/bin/ruby $out/share/bushpig/bushpig "\$@"
EOF
    chmod +x $bin
  '';
}
