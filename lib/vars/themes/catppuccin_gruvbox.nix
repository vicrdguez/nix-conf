# Mix of catppuccin with gruvbox and a sprinkle of kanagawa-dragon
mode:
let
  colors = {
    dark = {
      fg = "#d5c4a1";
      fg_bright = "#ebdbb2";
      bg = "#1d2021";
      bg_bright = "#1d2021";
      black = "#141617";
      red = "#ea6962";
      red_bright = "#ea6962";
      # red_bright = "#c4746e";
      green = "#a9b665";
      green_rgba = transparency: "rgba(216, 166, 87, ${transparency})";
      green_bright = "#89b482";
      yellow = "#d8a657";
      yellow_rgba = transparency: "rgba(216, 166, 87, ${transparency})";
      yellow_bright = "#d8a657";
      # yellow_bright = "#E6C384";
      blue = "#7daea3";
      blue_bright = "#7daea3";
      # blue_bright = "#7FB4CA";
      magenta = "#d3869b";
      magenta_bright = "#d3869b";
      # magenta_bright = "#a292a3";
      cyan = "#8ea4a2";
      cyan_bright = "#7AA89F";
      white = "#ebdbb2";
      idx_16 = "#b6927b";
      idx_17 = "#e78a4e";
      selection = "#a89984";
    };
    light = { };
  };
in
colors.dark
