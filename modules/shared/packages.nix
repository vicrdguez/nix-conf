# My list of home-manager packages. I prefer to keep the list of packages in an independent file for
# more clarity and readability.
#
# Remember to run `home-manager switch --flake ~/.config/_system` after adding things here.
# Alternative, the fish alias `hmrebuild` should also be available for short
#
{pkgs, ...}:
with pkgs; [
  ripgrep
  jq

  # For peek.nvim
  deno

  # Nice nix formatting
  alejandra

  # My braindump lives here
  obsidian

  # Manage todos and productivity. The electron package is the official todoist client
  # The package does not support darwin for now
  todoist-electron

  # Slack client for all things company messaging
  slack

  # All things music
  spotify
]
