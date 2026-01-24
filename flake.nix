{
  description = "System configuration and home-manager";
  outputs =
    { self
    , nixpkgs
    , home-manager
    , ...
    } @ inputs:
    let
      vars = (lib.evalModules { modules = [ ./lib/vars ]; }).config;
      darwinSystems = [
        #"x86_64-darwin"
        "aarch64-darwin"
      ];
      linuxSystems = [ ];
      allSystems = darwinSystems ++ linuxSystems;
      lib = nixpkgs.lib // home-manager.lib;
      clib = import ./lib { inherit lib inputs vars; };
      pkgsFor = lib.genAttrs allSystems (system:
        import nixpkgs {
          inherit system;
          config.allowUnfree = true;
          # overlays = [ inputs.nvim-conf.overlays.default ];
	  overlays = [ inputs.nvim-nightly.overlays.default ];
        });
    in
    {
      darwinConfigurations = {
        #"C02GN16H1PG2" = clib.mkMacosSystem pkgsFor.x86_64-darwin;
        "MYGDH633P6" = clib.mkMacosSystem pkgsFor.aarch64-darwin;
        "m4mbair" = clib.mkMacosSystem pkgsFor.aarch64-darwin;
      };

      homeConfigurations = {
        #"${vars.user.name}@C02GN16H1PG2" = clib.mkHome pkgsFor.x86_64-darwin;
        "${vars.user.name}@MYGDH633P6" = clib.mkHome {
          pkgs = pkgsFor.aarch64-darwin;
          extraModules = [];
          #extraModules = [ inputs.nvim-conf.modules.home-manager ];
        };
        "vrod@m4mbair" = clib.mkHome {
          pkgs = pkgsFor.aarch64-darwin;
          extraModules = [];
          #extraModules = [ inputs.nvim-conf.modules.home-manager ];
        };
      };
    };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    # home-manager lets me configure packages by symlinking generated configs into appropiate directories
    home-manager = {
      url = "github:nix-community/home-manager";
      # makes home-manager use our choice of nixpkgs
      inputs.nixpkgs.follows = "nixpkgs";
    };
    darwin = {
      url = "github:LnL7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvim-conf = {
      url = "github:vicrdguez/nvim-conf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvim-nightly.url = "github:nix-community/neovim-nightly-overlay";
  };
}
