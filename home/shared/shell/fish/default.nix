{ pkgs, vars, darwin, ... }:
let
  brewPrefix =
    if pkgs.stdenv.hostPlatform.isAarch64 then "/opt/homebrew/bin"
    else "/usr/local/bin";
  brewEnvInit = if true then ''eval (${brewPrefix}/brew shellenv)'' else '''';
in
{
  programs.fish = {
    enable = true;
    shellAliases = {
      nv = "nvim";
      drebuild = "darwin-rebuild switch --flake ~/.config/_system";
      hmrebuild = "home-manager switch --flake ~/.config/_system";
      hm = "home-manager";
      tf = "terraform";
      mcp = "mvnd clean package";
      mvn = "mvnd";
      ll = "exa -l";
      la = "exa -la";
      zat = "zathura";
    };
    shellInit =
      /*
        fish
        */
      ''
        if test -c "/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish"
            source /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish
        end

        if test -c "/nix/var/nix/profiles/default/etc/profile.d/nix.fish"
            source /nix/var/nix/profiles/default/etc/profile.d/nix.fish
        end
        set -gx EDITOR nvim
        set -gx ZK_NOTEBOOK_DIR /Users/vrodriguez/dev/kb/braindump
        ${brewEnvInit}
      '';
    interactiveShellInit =
      /*
        fish
        */
      ''
          # Some light theming
          set -g fish_color_command green

	  ~/.local/bin/mise activate fish | source
          eval (zellij setup --generate-auto-start fish | string collect)

          nix-your-shell fish | source
        # TODO fix path, dependent on machine
        #/Users/vrodriguez/.nix-profile/bin/mise activate fish | source
      '';
  };
}
