{ vars, lib, config, ... }:
let
  colors = vars.colorschemes.${config.colorscheme};
in
{
  options = {
    colorscheme = lib.mkOption {
      default = "kanagawa_dragon";
      type = lib.types.str;
      description = "fzf colorscheme";
    };
  };
  config =
    {
      programs.fzf = {
        enable = true;
        enableFishIntegration = true;
        colors = {
          bg = colors.bg;
          "bg+" = colors.black;
          fg = colors.fg;
          "fg+" = colors.fg_bright;
          spinner = colors.green;
          hl = colors.yellow;
          header = colors.yellow;
          info = colors.blue;
          pointer = colors.red;
          marker = colors.red;
          prompt = colors.yellow;
          "hl+" = colors.red;
        };
      };
    };
}
