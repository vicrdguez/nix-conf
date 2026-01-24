{ pkgs, lib, config, ... }:
{
  options = {
    ghostty.enable = lib.mkEnableOption "Enable ghostty as the terminal";
  };
  config = lib.mkIf config.ghostty.enable {
    home.file = {
      ".config/ghostty/config" =
        {
          text = ''
            theme = custom
            window-subtitle = false
            window-decoration = none
            macos-titlebar-style = hidden
            background-opacity = 1
            font-size = 18
            font-family = Iosevka
            command = ${pkgs.fish}/bin/fish
          '';
        };
      ".config/ghostty/themes/custom" =
        let colors = config.theme.scheme;
        in
        {
          text = ''
            palette = 0=${colors.black}
            palette = 1=${colors.red}
            palette = 2=${colors.green}
            palette = 3=${colors.yellow}
            palette = 4=${colors.blue}
            palette = 5=${colors.magenta}
            palette = 6=${colors.cyan}
            palette = 7=${colors.idx_17}
            #palette = 8=${colors.bg_bright}
            palette = 8=${colors.selection}
            palette = 9=${colors.red_bright}
            palette = 10=${colors.green_bright}
            palette = 11=${colors.yellow_bright}
            palette = 12=${colors.blue_bright}
            palette = 13=${colors.magenta_bright}
            palette = 14=${colors.cyan_bright}
            palette = 15=${colors.white}
            background = ${colors.bg}
            foreground = ${colors.fg}
            cursor-color = ${colors.fg}
            cursor-text = ${colors.black}
            selection-background = ${colors.yellow}
            selection-foreground = ${colors.yellow}
          '';
        };

    };
  };
}

