{
  colors = rec {
    true-white = "FFFFFF";  #FFFFFF
    true-black = "000000";  #000000

    black = "4c4f69";  #665C54
    black-alt = "282828";  #282828
    white = "ccd0da";  #DFBF8E
    gray = "778691";  #778691
    gray-alt = "AFB7BD";  #AFB7BD
    blue = "2C93D4";  #2C93D4
    blue-alt = "69AFDB";  #69AFDB
    red = "e64553";  #EA6962
    red-alt = "d20f39";
    green = "40a02b";  #A9B665
    yellow = "df8e1d";  #E78A4E
    magenta = "D3869B";  #D3869B
    cyan = "209fb5";  #89B482
    cyan-alt = "04a5e5";  #7DAEA3
    rose = "dc8a78";
    lavender = "7287fd";
    flamingo = "dd7878";
    sapphire = "209fb5";


    # Symbolic names
    foreground = black;
    background = white;

    focused = blue;
    focused-alt = blue-alt;
    inactive = gray;
    inactive-alt = gray-alt;

    warning = yellow;
    error = red-alt;

    window-manager = {
      focused = focused;
    };

    notifications = {
      background = true-white;
      foreground = gray;
    };

    bar = {
      background = white;
      foreground = black;

      warning = yellow;
      critical = red-alt;

      launcher = cyan-alt;
      workspace = cyan;
      datetime = lavender;
      network = flamingo;
      sound = sapphire;
      battery = green;
      power = red;
    };
  };
}
