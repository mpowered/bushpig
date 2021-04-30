with import <nixpkgs> {};
stdenv.mkDerivation {
  name = "env";
  buildInputs = [
    ruby.devEnv
    git
    libxml2
    libxslt
    pkg-config
    bundix
    gnumake
  ];
}
