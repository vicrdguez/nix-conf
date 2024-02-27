{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # The bloated all-mighty editor
    emacs29-macport
  ];
}
