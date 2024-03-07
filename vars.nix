rec {
  user = "vrodriguez";
  fullName = "Victor Rodriguez";
  email = "contact@vicrodriguez.dev";

  darwinSystems = [
    "x86_64-darwin"
  ];
  linuxSystems = [ ];

  allSystems = darwinSystems ++ linuxSystems;

  # cursor_bg = "#C8C093",
  # cursor_fg = "#C8C093",
  # cursor_border = "#c8c093",
  #
  # selection_fg = "#c8c093",
  # selection_bg = "#2d4f67",
  #
  # scrollbar_thumb = "#16161d",
  # split = "#16161d",
  #
  # ansi = { "#0d0c0c", "#c4746e", "#8a9a7b", "#c4b28a", "#8ba4b0", "#a292a3", "#8ea4a2", "#C8C093" },
  # brights = { "#a6a69c", "#E46876", "#87a987", "#E6C384", "#7FB4CA", "#938AA9", "#7AA89F", "#c5c9c5" },
  # indexed = { [16] = "#b6927b", [17] = "#b98d7b" },

  confDir = ''$HOME/.config'';
  colorschemes = {
    kanagawa_dragon = {
      fg = "#C8C093";
      fg_bright = "#c5c9c5";
      bg = "#181616";
      bg_bright = "#a6a69c";
      black = "#0d0c0c";
      red = "#c4746e";
      green = "#8a9a7b";
      green_2= "#87a987";
      yellow = "#c4b28a";
      blue = "#8ba4b0";
      magenta = "#a292a3";
      cyan = "#8ea4a2";
      white = "#C8C093";
      idx_16 = "#b6927b";
      idx_17 = "#b98d7b";
    };
  };
}
