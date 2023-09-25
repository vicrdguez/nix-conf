{pkgs, ...}: {
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';
  # Darwin configs
  services = {nix-daemon.enable = true;};
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
    shells = with pkgs; [bash zsh fish];
    loginShell = pkgs.zsh;
  };

  # Needed to fix weird bug that appears to be present only on darwin
  # https://github.com/nix-community/home-manager/issues/4026
  # https://discourse.nixos.org/t/support-request-conflicting-definition-of-homedirectory-while-integrating-nix-darwin-and-home-manager/13927/5
  users.users.vrodriguez.home = "/Users/vrodriguez";

  # I'll keep the programs set lean, since I prefer to handle software with home-manager to re-use
  # code in other machines
  # programs = { fish.enable = true; };
}
