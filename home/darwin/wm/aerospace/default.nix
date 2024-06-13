{ pkgs, vars, lib, config, ... }:
{
  options = {
    aerospace.enable = lib.mkEnableOption "aerospace wm";
  };
  config = lib.mkIf config.aerospace.enable {
    xdg.configFile = {
      "aerospace/aerospace.toml" = {
        source = ./aerospace.toml;
        executable = true;
      };
    };
  };
}
