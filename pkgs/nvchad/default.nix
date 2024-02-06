{ pkgs, stdenv, lib, ... }:
let
  custom = ./custom;
in
stdenv.mkDerivation rec {
  pname = "nvchad";
  version = "2.0";

  src = pkgs.fetchFromGitHub {
    owner = "nvchad";
    repo = "nvchad";
    rev = "refs/heads/v${version}";
    sha256 = "sha256-+yjMIzWs7h217SxmTocpkC06Y3vEcDvVyMuhtaQGeF0=";
  };

  installPhase = ''
    mkdir $out
    cp -r * "$out/"
    mkdir -p "$out/lua/custom"
    cp -r ${custom}/* "$out/lua/custom/"
  '';

  meta = with lib; {
    description = "NvChad";
    homepage = "https://github.com/NvChad/NvChad";
    platforms = platforms.all;
    license = licenses.gpl3;
  };
}
