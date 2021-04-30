{ bundlerEnv, lib, ruby }:

bundlerEnv {
  inherit ruby;
  pname = "bushpig";
  gemdir = ./.;
}
