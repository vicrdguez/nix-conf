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
    term = {
      wezterm = lib.mkOption {
        type = lib.types.bool;
        default = false;
      };
      ghostty = lib.mkOption {
        type = lib.types.bool;
        default = false;
      };
      alacritty = lib.mkOption {
        type = lib.types.bool;
        default = false;
      };
    };
  };

  config = {
    user = {
      #name = "vrodriguez";
      name = "vrod"; # TODO, make this configurable, differs from machine to machine
      fullName = "Victor Rodriguez";
      email = "contact@vicrodriguez.dev";
    };
    # yabai for darwin, on nixos still to decide
    windowManager.name = if lib.hasSuffix "darwin" pkgs.system then "yabai" else "";
    windowManager.enable = lib.mkDefault true;
    # see ./themes/default.nix for theme defaults not mentioned here
    # theme.name = "kanagawa_dragon";
    theme.name = "catppuccin_gruvbox";
  };
}
