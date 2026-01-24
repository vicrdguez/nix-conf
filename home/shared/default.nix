{ pkgs, lib, config, ... }:
{
  imports = [
    ./custom-tools
    ./cli-tools
    ./shell
    ./term
    ./apps
  ];

  home = {
    username = config.user.name;
    homeDirectory = "/Users/${config.user.name}";
    stateVersion = "25.05";
    # this are packages without particular configuration
    packages = import ./packages.nix { inherit pkgs; };
  };
  xdg.enable = true;

  term.wezterm = true;
  term.ghostty = true;
  cli = {
    # enable cli tools, all are enabled by default so this is more 
    # tailored to disable things
  };
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
  programs.home-manager.enable = true;
}
