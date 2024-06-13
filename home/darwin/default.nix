{ pkgs, lib, config, vars, ... }:
{
  imports = [
    ./wm
  ];

  yabai.enable = false;
  aerospace.enable = true;

  home.packages = with pkgs; [
    # The bloated all-mighty editor
    #emacs29-macport
    raycast
  ];
}
