{ pkgx, lib, config, ... }:
{
  # imports = [
  #   ./kanagawa_dragon.nix
  # ];
  options = {
    theme.name = lib.mkOption {
      type = lib.types.str;
      default = "kanagawa_dragon";
    };
    theme.scheme = lib.mkOption {
      type = lib.types.attrs;
      readOnly = true;
    };
    theme.mode = lib.mkOption {
      type = lib.types.enum [ "dark" "light" ];
      default = "dark";
    };
  };
  config =
    let
      theme = import ./${config.theme.name}.nix;
    in
    {
      theme.scheme = theme config.theme.mode;
    };
}
