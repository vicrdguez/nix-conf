{ pkgs }:
with pkgs; [
  ripgrep
  jq
  # For peek.nvim
  deno
  # Nice nix formatting
  alejandra
  nixpkgs-fmt
  # My braindump lives here
  obsidian
  # Slack client for all things company messaging slack
  slack
  # All things music
  spotify
  # Confluent own cli tool
  confluent-cli
  # Golang language server
  gopls
  # packages to display images on neovim.
  luajitPackages.magick
  imagemagick
  ueberzugpp
  # to manage runtime versions
  mise
  # use your preferred shell when using nix develop
  nix-your-shell
  # Java packaging
  gradle
  # min-io cli client
  minio-client
  cowsay
  alacritty
  just
  nvim-custom-fzf
  eza
  fd
  zellij
  kcat
  zk
  # wezterm
  bat
  coreutils
  gh
  # bashly
  flameshot
  # podman
]
