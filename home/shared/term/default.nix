{ pkgx, lib, config, ... }:
{
  imports = [
    ./wezterm
    ./alacritty
  ];
  wezterm.enable = config.term.wezterm;
  # alacritty.enable = config.term.alacritty;
}
