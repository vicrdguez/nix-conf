{ pkgs, lib, config, vars, ... }:
{
  imports = [
    ./wm
  ];

  yabai.enable = config.windowManager.enable;

  home.packages = with pkgs; [
    # The bloated all-mighty editor
    emacs29-macport
    raycast
  ];
}
