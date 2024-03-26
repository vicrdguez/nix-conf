{ pkgs, config, ... }:
{
  imports = [
    ./cli-tools
    ./shell
    ./term
  ];

  home = {
    username = config.user.name;
    homeDirectory = "/Users/${config.user.name}";
    stateVersion = "23.05";
    # this are packages without particular configuration
    packages = import ./packages.nix { inherit pkgs; };
  };

  term.wezterm = true;
  cli = {
      # enable cli tools, all are enabled by default so this is more 
      # tailored to disable things
  };
  programs.home-manager.enable = true;
}
