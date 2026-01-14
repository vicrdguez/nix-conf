{ lib, config, pkgs, ... }:
{
  options = {
    apps.zathura.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
  };
  config = lib.mkIf config.apps.zathura.enable {
    programs.zathura =
      let colors = config.theme.scheme;
      in
      {
        enable = true;
        options = {
          font = "Iosevka 16";
          adjust-open = "best-fit";
          highlight-fg = "#000000";
          # FIX Some themes do not have this attrs. making the build fail
          # highlight-color = colors.yellow_rgba "0.2";
          # highlight-active-color = colors.green_rgba "0.2";
          default-bg = colors.bg;
          default-fg = colors.fg;
          recolor-darkcolor = colors.fg;
          recolor-lightcolor = colors.black;
          statusbar-bg = colors.bg;
          statusbar-fg = colors.fg_bright;
          inputbar-fg = colors.yellow;
          inputbar-bg = colors.black;
          recolor = "true";
        };
      };
  };
}
