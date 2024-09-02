{ vars, lib, config, ... }:
{
  options = {
    cli.fzf.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
  };
  config = lib.mkIf config.cli.fzf.enable
    {
      programs.fzf =
        let colors = config.theme.scheme;
        in
        {
          enable = true;
          enableFishIntegration = true;
          colors = {
            bg = colors.black;
            "bg+" = colors.bg;
            fg = colors.fg;
            "fg+" = colors.fg_bright;
            spinner = colors.green;
            hl = colors.yellow;
            header = colors.yellow;
            info = colors.blue;
            pointer = colors.red;
            marker = colors.red;
            prompt = colors.yellow;
            "hl+" = colors.red;
          };
          defaultOptions = [
            "--layout reverse"
          ];
          defaultCommand = "fd --type f --exclude .git --hidden";
          fileWidgetCommand = "fd --type f --exclude .git --hidden";
          fileWidgetOptions = [
            "--preview 'bat {}'"
          ];
        };
    };
}
