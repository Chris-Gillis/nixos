let
  mkWallpaper = path: path;
in
{
  test-wallpaper = mkWallpaper ./space.jpg;
}
