{ pkgs, lib, config, ... }:
{
  imports = [
    ./themes
  ];

  options = {
    user = {
      name = lib.mkOption {
        type = lib.types.str;
        readOnly = true;
      };
      fullName = lib.mkOption {
        type = lib.types.str;
        readOnly = true;
      };
      email = lib.mkOption {
        type = lib.types.str;
        readOnly = true;
      };
    };
    windowManager = {
      name = lib.mkOption {
        type = lib.types.str;
        readOnly = true;
      };
      enable = lib.mkEnableOption "window manager";
    };
  };

  config = {
    user = {
      name = "vrodriguez";
      fullName = "Victor Rodriguez";
      email = "contact@vicrodriguez.dev";
    };
    # yabai for darwin, on nixos still to decide
    windowManager.name = if lib.hasSuffix "darwin" pkgs.system then "yabai" else "";
    windowManager.enable = lib.mkDefault true;
    # see ./themes/default.nix for theme defaults not mentioned here
    theme.name = "kanagawa_dragon";
  };
}
