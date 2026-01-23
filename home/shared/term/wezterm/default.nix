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
        let
          colors = config.theme.scheme;
          name = config.theme.name;
        in
        {
          text =
            if name == "vague"
            then
            /*lua*/''
                        return {
              		foreground = "#cdcdcd",
              		background = "#141415",

              		cursor_bg = "#cdcdcd",
              		cursor_fg = "#141415",
              		cursor_border = "#cdcdcd",

              		selection_fg = "#cdcdcd",
              		selection_bg = "#252530",

              		scrollbar_thumb = "#252530",
              		split = "#252530",

              		ansi = {
              			"#252530",
              			"#d8647e",
              			"#7fa563",
              			"#f3be7c",
              			"#6e94b2",
              			"#bb9dbd",
              			"#aeaed1",
              			"#cdcdcd",
              		},
              		brights = {
              			"#606079",
              			"#e08398",
              			"#99b782",
              			"#f5cb96",
              			"#8ba9c1",
              			"#c9b1ca",
              			"#bebeda",
              			"#d7d7d7",
              		},
              		tab_bar = {
              			background = "#141415",
              			active_tab = {
              				bg_color = "#252530",
              				fg_color = "#cdcdcd",
              				intensity = "Normal",
              				underline = "None",
              				italic = false,
              				strikethrough = false,
              			},
              			inactive_tab = {
              				bg_color = "#141415",
              				fg_color = "#606079",
              				intensity = "Normal",
              				underline = "None",
              				italic = false,
              				strikethrough = false,
              			},
              			inactive_tab_hover = {
              				bg_color = "#252530",
              				fg_color = "#cdcdcd",
              				italic = false,
              			},
              			new_tab = {
              				bg_color = "#141415",
              				fg_color = "#6e94b2",
              			},
              			new_tab_hover = {
              				bg_color = "#252530",
              				fg_color = "#8ba9c1",
              			},
              			inactive_tab_edge = "#252530",
              		},
              	}
            ''
            else
            /*lua*/''
              return {
                  force_reverse_video_cursor = true,
                  colors = {
                      foreground = "${colors.fg_bright}",
                      background = "${colors.bg}",

                      cursor_bg = "${colors.fg}",
                      cursor_fg = "${colors.fg}",
                      cursor_border = "${colors.fg}",

                      selection_fg = "${colors.bg}",
                      selection_bg = "${colors.selection}",

                      scrollbar_thumb = "${colors.black}",
                      split = "${colors.bg}",

                      ansi = {
                          "${colors.black}",
                          "${colors.red}",
                          "${colors.green}",
                          "${colors.yellow}",
                          "${colors.blue}",
                          "${colors.magenta}",
                          "${colors.cyan}",
                          "${colors.fg}"
                      },
                      brights = {
                          "${colors.bg_bright}",
                          "${colors.red_bright}",
                          "${colors.green_bright}",
                          "${colors.yellow_bright}",
                          "${colors.blue_bright}",
                          "${colors.magenta_bright}",
                          "${colors.cyan_bright}",
                          "${colors.fg_bright}"
                      },
                      indexed = {
                          [16] = "${colors.idx_16}",
                          [17] = "${colors.idx_17}"
                      },
                  }
              }
            '';
        };

    };
  };
}

