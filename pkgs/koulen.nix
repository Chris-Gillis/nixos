{ lib, stdenv, fetchFromGitHub, ... }:

stdenv.mkDerivation {
  pname = "koulen";
  version = "0.1";
  src = fetchFromGitHub {
    owner = "danhhong";
    repo = "Koulen";
    rev = "master";
    sha256 = "sha256-TTs/t4BgtvUqmLuh9rX6v5L4IKNqHPN4r8Mt0JIX0cE=";
  };

  dontBuild = true;
  dontConfigure = true;

  installPhase = ''
    mkdir -p $out/share/fonts
    cp $src/Release/ttf/* $out/share/fonts/
  '';

  meta = {
    description = "Koulen font";
  };
}
