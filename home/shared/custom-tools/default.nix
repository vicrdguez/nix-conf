{ lib, config, pkgs, ... }:
{
  options = {
    custom.ntpl.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
  };
  # https://discourse.nixos.org/t/link-scripts-to-bin-home-manager/41774
  config =
    let
      script = name: lib.mkIf config.custom."${name}".enable
        (pkgs.writeShellScriptBin "${name}" (builtins.readFile ./scripts/${name}/${name}));
    in
    {
      # Adds custom packages
      home.packages = [
        (script "ntpl")
      ];
    };
}
