{ lib, config, pkgs, ... }:
{
  options = {
    apps.firefox.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
  };
  config = lib.mkIf config.apps.firefox.enable {
    home.packages = [ pkgs.tridactyl-native ];
    home.file = {
      ".tridactylrc".text = ''
        " Handy multiwindow/multitasking binds
        bind gd tabdetach
        bind gD composite tabduplicate; tabdetach
        " Use ctrl-p/n to move between completions
        bind --mode=ex <C-p> ex.prev_completion
        bind --mode=ex <C-n> ex.next_completion
        " Binds for new reader mode
        bind gr reader
        bind gR reader --tab
        " Sane hinting mode
        set hintfiltermode vimperator-reflow
        set hintnames numeric
        " Defaults to 300ms but I'm a 'move fast and close the wrong tabs' kinda chap
        set hintdelay 100
        " search urls
        set searchurls.s https://app.glean.com/search?q=%s
        set searchurls.gh https://github.com/search?q=%s&type=repositories
        set searchurls.ghc https://github.com/search?q=org%3Aconfluentinc+%s&type=repositories
        set searchurls.g https://www.google.com/search?q=%s
        set searchurls.nix https://search.nixos.org/packages?channel=unstable&from=0&size=50&sort=relevance&type=packages&query=%s
      '';
    };
  };
}
