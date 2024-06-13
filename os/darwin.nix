{ pkgs, vars, config, ... }: {
  # This won't install hombrew itself. Needs to be installed separately
  homebrew = {
    enable = true;
    taps = [
      "FelixKratz/formulae"
      "homebrew/cask-fonts"
      ## for Podman, until this is fixed: https://github.com/NixOS/nixpkgs/issues/305868
      "cfergeau/crc"
    ];
    casks = [
      "wezterm"
      "flameshot"
      "firefox"
      "brave-browser"
      "nikitabobko/tap/aerospace"
    ];
    brews = [
      "borders"
      "jr"
      "mvndaemon/homebrew-mvnd/mvnd"
      "chezmoi"
      ## for Podman, until this is fixed: https://github.com/NixOS/nixpkgs/issues/305868
      "vfkit"
    ];
  };
  nix.extraOptions = ''
    experimental-features = nix-command flakes
    experimental-features = nix-command flakes repl-flake
    bash-prompt-prefix = (nix:$name)\040
    extra-nix-path = nixpkgs=flake:nixpkgs
    #upgrade-nix-store-path-url = https://install.determinate.systems/nix-upgrade/stable/universal
  '';
  # Darwin configs
  services = {
    nix-daemon.enable = true;
    yabai = {
      #enable = config.windowManager.enable;
      enable = false;
      enableScriptingAddition = true;
    };
    #skhd.enable = config.windowManager.enable;
    skhd.enable = false;
  };
  programs.zsh.enable = true;
  programs.fish.enable = true;
  nixpkgs = {
    hostPlatform = pkgs.system;
    config = {
      allowUnfree = true;
    };
  };
  # Disable more animations: https://apple.stackexchange.com/questions/14001/how-to-turn-off-all-animations-on-os-x
  system = {
    defaults = {
      dock = {
        autohide = true;
        mru-spaces = false;
        expose-animation-duration = 0.0;
      };
      spaces.spans-displays = false;
      finder = {
        AppleShowAllExtensions = true;
        AppleShowAllFiles = true;
      };
      universalaccess.reduceMotion = true;
      NSGlobalDomain = {
        AppleShowAllExtensions = true;
        AppleInterfaceStyle = "Dark";
        InitialKeyRepeat = 14;
        KeyRepeat = 1;
        NSUseAnimatedFocusRing = false;
        NSWindowShouldDragOnGesture = true;
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
    extraInit = ''
      eval "$(${config.homebrew.brewPrefix}/brew shellenv)"
    '';
  };
  fonts = {
    fontDir.enable = true;
    fonts = [ pkgs.iosevka ];
  };
  # Needed to fix weird bug that appears to be present only on darwin
  # https://github.com/nix-community/home-manager/issues/4026
  # https://discourse.nixos.org/t/support-request-conflicting-definition-of-homedirectory-while-integrating-nix-darwin-and-home-manager/13927/5
  users.users.${config.user.name}.home = "/Users/${config.user.name}";
}
