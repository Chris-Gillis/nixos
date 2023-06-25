{
  colors = rec {
    true-white = "FFFFFF";  #FFFFFF
    true-black = "000000";  #000000

    black = "665C54";  #665C54
    black-alt = "282828";  #282828
    white = "DFBF8E";  #DFBF8E
    gray = "778691";  #778691
    gray-alt = "AFB7BD";  #AFB7BD
    blue = "2C93D4";  #2C93D4
    blue-alt = "69AFDB";  #69AFDB
    red = "EA6962";  #EA6962
    green = "A9B665";  #A9B665
    yellow = "E78A4E";  #E78A4E
    magenta = "D3869B";  #D3869B
    cyan = "89B482";  #89B482
    cyan-alt = "7DAEA3";  #7DAEA3


    # Symbolic names
    foreground = white;
    background = black-alt;

    focused = blue;
    focused-alt = blue-alt;
    inactive = gray;
    inactive-alt = gray-alt;

    warning = yellow;
    error = red;

    window-manager = {
      focused = focused;
    };

    notifications = {
      background = true-white;
      foreground = gray;
    };
  };
}
