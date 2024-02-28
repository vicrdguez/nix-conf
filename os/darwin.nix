{ pkgs, vars, ... }: {
  homebrew = {
    enable = true;
    taps = [
      "FelixKratz/formulae"
      "homebrew/cask-fonts"
    ];
    casks = [
      # "wezterm"
    ];
    brews = [
      "borders"
      "jr"
      "mvndaemon/homebrew-mvnd/mvnd"
      "chezmoi"
    ];
  };

  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';
  # Darwin configs
  services = {
    nix-daemon.enable = true;
    yabai = {
      enable = true;
      enableScriptingAddition = true;
    };
    skhd.enable = true;
  };
  system = {
    defaults = {
      dock.autohide = true;
      finder = {
        AppleShowAllExtensions = true;
        AppleShowAllFiles = true;
      };
      NSGlobalDomain = {
        AppleShowAllExtensions = true;
        InitialKeyRepeat = 14;
        KeyRepeat = 1;
      };
    };
    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToControl = true;
    };
  };
  environment = {
    shells = with pkgs; [ bash zsh fish ];
    loginShell = pkgs.zsh;
    variables = {
      EDITOR = "nvim";
      ZK_NOTEBOOK_DIR = "/Users/vrodriguez/dev/kb/braindump";
    };
  };
  # Needed to fix weird bug that appears to be present only on darwin
  # https://github.com/nix-community/home-manager/issues/4026
  # https://discourse.nixos.org/t/support-request-conflicting-definition-of-homedirectory-while-integrating-nix-darwin-and-home-manager/13927/5
  users.users.${vars.user}.home = "/Users/${vars.user}";
}
