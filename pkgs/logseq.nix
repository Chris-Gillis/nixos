{
  appimageTools
, fetchurl
}:
let
  version = "0.10.5";
in 
appimageTools.wrapType2 {
  name = "logseq";
  version = version;
  src = fetchurl {
    url = "https://github.com/logseq/logseq/releases/download/${version}/logseq-linux-x64-${version}.AppImage";
    hash = "sha256-F3YbqgvL04P0nXaIVkJlCq/z8hUE0M0UutkBs2omuBE=";
  };
}
