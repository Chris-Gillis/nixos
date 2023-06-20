{ lib, stdenv, fetchzip, ... }:

stdenv.mkDerivation {
  pname = "breezex-icon-theme";
  version = "2.0.0";
  src = fetchzip {
    url = "https://github.com/ful1e5/BreezeX_Cursor/releases/download/v2.0.0/BreezeX-Dark.tar.gz";
    sha256 = "sha256-JPPVPU2nXqN4WFMsAcPEyt2M1n6iwkjytT9zF99YeO8=";
  };

  dontBuild = true;
  dontConfigure = true;

  installPhase = ''
    mkdir -p $out/share/icons/BreezeX-Dark
    cp -r $src/* $out/share/icons/BreezeX-Dark/
  '';

  meta = {
    description = "BreezeX Cursore theme";
  };
}
