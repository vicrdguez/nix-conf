{ pkgs, vars, lib, config, ... }:
{
  options = {
    yabai.enable = lib.mkEnableOption "yabai wm";
  };
  config = lib.mkIf config.yabai.enable {
    home.packages = with pkgs; [
      yabai
      skhd
    ];

    home.file = {
      ".config/yabai/yabairc" = {
        source = ./yabairc;
        executable = true;
      };
      ".config/skhd/skhdrc" = {
        source = ./skhdrc;
        executable = true;
      };
    };
  };
}
