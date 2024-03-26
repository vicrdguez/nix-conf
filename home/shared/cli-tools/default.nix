{ pkgs, config, ... }:
{
  # Implement something that includes all modules in this directory, like
  # - https://github.com/yunfachi/nypkgs/blob/master/lib/umport.nix
  # - https://gist.github.com/yunfachi/6c073cc6edc18f78cfc60bb9bb3f7143
  imports = [
    ./git
    ./fzf
    ./starship
    ./zellij
  ];
}
