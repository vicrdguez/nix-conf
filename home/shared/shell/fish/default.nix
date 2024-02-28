{ vars, ... }:
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

        # Base16 Gruvbox dark, hard
        # Scheme author: Dawid Kurek (dawikur@gmail.com), morhetz (https://github.com/morhetz/gruvbox)
        # Template author: Tinted Theming (https://github.com/tinted-theming)
        # set -l color00 '#1d2021'
        # set -l color01 '#3c3836'
        # set -l color02 '#504945'
        # set -l color03 '#665c54'
        # set -l color04 '#bdae93'
        # set -l color05 '#d5c4a1'
        # set -l color06 '#ebdbb2'
        # set -l color07 '#fbf1c7'
        # set -l color08 '#fb4934'
        # set -l color09 '#fe8019'
        # set -l color0A '#fabd2f'
        # set -l color0B '#b8bb26'
        # set -l color0C '#8ec07c'
        # set -l color0D '#83a598'
        # set -l color0E '#d3869b'
        # set -l color0F '#d65d0e'
        #
        # set -l FZF_NON_COLOR_OPTS
        #
        # for arg in (echo $FZF_DEFAULT_OPTS | tr " " "\n")
        #     if not string match -q -- "--color*" $arg
        #         set -a FZF_NON_COLOR_OPTS $arg
        #     end
        # end
        #
        # set -Ux FZF_DEFAULT_OPTS \
        # " --color=bg+:$color01,bg:$color00,spinner:$color0C,hl:$color0D\
        #  --color=fg:$color04,header:$color0D,info:$color0A,pointer:$color0C\
        #  --color=marker:$color0C,fg+:$color06,prompt:$color0A,hl+:$color0D";

      '';
    interactiveShellInit =
      /*
        fish
        */
      ''

          nix-your-shell fish | source
          /Users/vrodriguez/.nix-profile/bin/mise activate fish | source
        '';
  };
}
