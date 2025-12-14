{ pkgx, lib, config, ... }:
{
  imports = [
    ./wezterm
    ./alacritty
    ./ghostty
  ];
  wezterm.enable = config.term.wezterm;
  ghostty.enable = config.term.ghostty;
  # alacritty.enable = config.term.alacritty;
}
