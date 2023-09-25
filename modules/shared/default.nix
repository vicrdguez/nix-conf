{
  lib,
  config,
  pkgs,
  ...
}: {
  home.stateVersion = "23.05";
  home.username = "vrodriguez";
  home.homeDirectory = "/Users/vrodriguez";
  home.packages = import ./packages.nix {inherit pkgs;};
  # home.activation = {
  # A workaround to install graphical apps on macos. These *.app applications get built/downloaded
  # in ~/.nix-profile/  which is a symlink to a generated home-manager profile in the nix-store.
  # It goes over multiple symliks to reach the final dir in the nix-store. Graphical apps are
  # placed into ~/.nix-profile/Applications/ which is as well a symlink to the home-manager path
  #generation in the nix-store.
  #
  # Spotlight can't search in this folder, and finder has issues pointing to the folder since the
  # symlinks change on every home-manager generation and often takes you to the wrong nix-store folder
  # until you force-close it and open it again. This is a problem for other launchers like Raycast which
  # appear to depend inherit the issue and show the incorrect list of applications
  #
  # This workaround was taken from a big GH discusion on the matter in the home-manager repo:
  # https://github.com/nix-community/home-manager/issues/1341#issuecomment-1714800288
  
  # For some reason, now this is not needed and there is a Home Manager Apps symlink on ~/Applications/
  # that works with raycast out of the box
  #   trampolineApps = let
  #     apps = pkgs.buildEnv {
  #       name = "home-manager-apps";
  #       paths = config.home.packages;
  #       pathsToLink = "/Applications";
  #     };
  #   in
  #     lib.hm.dag.entryAfter ["writeBoundary"] ''
  #       toDir="$HOME/Applications/Home Manager Trampoline Apps"
  #       fromDir="${apps}/Applications"
  #       rm -rf "$toDir"
  #       mkdir "$toDir"
  #       (
  #         cd "$fromDir"
  #         for app in *.app; do
  #           /usr/bin/osacompile -o "$toDir/$app" -e 'do shell script "open \"$fromDir/$app\""'
  #           icon="$(/usr/bin/plutil -extract CFBundleIconFile raw "$fromDir/$app/Contents/Info.plist")"
  #           mkdir -p "$toDir/$app/Contents/Resources"
  #           cp -f "$fromDir/$app/Contents/Resources/$icon" "$toDir/$app/Contents/Resources/applet.icns"
  #         done
  #       )
  #     '';
  # };
  programs = {
    home-manager.enable = true;
    fish = {
      enable = true;
      shellAliases = {
        nv = "nvim";
        drebuild = "darwin-rebuild switch --flake ~/.config/_system";
        hmrebuild = "home-manager switch --flake ~/.config/_system";
        hm = "home-manager";
      };
      shellInit = ''
        if test -c "/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish"
            source /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish
        end

        if test -c "/nix/var/nix/profiles/default/etc/profile.d/nix.fish"
            source /nix/var/nix/profiles/default/etc/profile.d/nix.fish
        end
      '';
    };
    starship = {
      enable = true;
      enableFishIntegration = true;
      enableZshIntegration = true;
    };
    fzf = {
      enable = true;
      enableFishIntegration = true;
    };
  };
}
