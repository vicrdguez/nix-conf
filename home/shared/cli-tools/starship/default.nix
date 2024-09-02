{ lib, vars, config, ... }:
{
  options = {
    cli.starship.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
  };
  config = lib.mkIf config.cli.starship.enable {
    programs.starship = {
      enable = true;
      enableFishIntegration = true;
      enableZshIntegration = true;
    };
    xdg.configFile = {
      "starship.toml" = {
        source = ./starship.toml;
      };
    };
  };
}
