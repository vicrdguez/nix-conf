{ pkgs, lib, config, ... }:
{
  options = {
    wezterm.enable = lib.mkEnableOption "Enable wezterma as the terminal";
  };
  config = lib.mkIf config.wezterm.enable {
    home.file = {
      ".config/wezterm/wezterm.lua" = {
        source = ./wezterm.lua;
      };

      ".config/wezterm/theme.lua" =
        let colors = config.theme.scheme;
        in
        {
          text = ''
            return {
                force_reverse_video_cursor = true,
                colors = {
                    foreground = ${colors.fg_bright},
                    background = ${colors.bg},

                    cursor_bg = ${colors.fg},
                    cursor_fg = ${colors.fg},
                    cursor_border = ${colors.fg},

                    selection_fg = ${colors.fg},
                    selection_bg = ${colors.selection},

                    scrollbar_thumb = ${colors.bg},
                    split = ${colors.bg},

                    ansi = {
                        ${colors.black},
                        ${colors.red},
                        ${colors.green},
                        ${colors.yellow},
                        ${colors.blue},
                        ${colors.magenta},
                        ${colors.cyan},
                        ${colors.fg}
                    },
                    brights = {
                        ${colors.bg_bright},
                        ${colors.red_bright},
                        ${colors.green_bright},
                        ${colors.yellow_bright},
                        ${colors.blue_bright},
                        ${colors.magenta_bright},
                        ${colors.cyan_bright},
                        ${colors.fg_bright}
                    },
                    indexed = {
                        [16] = ${colors.idx_16},
                        [17] = ${colors.idx_17}
                    },
                }
            }
          '';
        };

    };
  };
}

