{ lib, stdenv, fetchzip, ... }:

stdenv.mkDerivation {
  pname = "phosphor-icons";
  version = "2.0.0";
  src = fetchzip {
    url = "https://github.com/phosphor-icons/homepage/releases/download/v2.0.0/phosphor-icons.zip";
    sha256 = "sha256-IfgGO56N8eO2MB8H16+KvkpHiHfs6SOEittYEnaVIfY=";
  };

  dontBuild = true;
  dontConfigure = true;

  installPhase = ''
    mkdir -p $out/share/fonts
    cp $src/Fonts/bold/Phosphor-Bold.ttf $out/share/fonts/
    cp $src/Fonts/duotone/Phosphor-Duotone.ttf $out/share/fonts/
    cp $src/Fonts/fill/Phosphor-Fill.ttf $out/share/fonts/
    cp $src/Fonts/light/Phosphor-Light.ttf $out/share/fonts/
    cp $src/Fonts/regular/Phosphor.ttf $out/share/fonts/
    cp $src/Fonts/thin/Phosphor-Thin.ttf $out/share/fonts/
  '';

  meta = {
    description = "Phosphor icon font";
  };
}
