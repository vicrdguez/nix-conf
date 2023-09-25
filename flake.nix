{
  description = "System configuration and home-manager";
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
  };
  outputs = {
    self,
    nixpkgs,
    home-manager,
    darwin,
  }: let
    system = "x86_64-darwin";
    pkgs = import nixpkgs {
      system = system;
      config.allowUnfree = true;
    };
  in {
    darwinConfigurations.C02GN16H1PG2 = darwin.lib.darwinSystem {
      inherit system pkgs;
      # system = "x86_64-darwin";
      # pkgs =
      modules = [
        # nix-darwin config
        ./modules/darwin

        ## home-manager as a darwin module.
        # home-manager.darwinModules.home-manager
        # {
        #   home-manager = {
        #     useGlobalPkgs = true;
        #     useUserPackages = true;
        #     # users.vrodriguez.home = /Users/vrodriguez;
        #     users.vrodriguez.imports = [ ./modules/home-manager ];
        #   };
        # }
      ];
    };
    ## stand alone home-manager. For now I prefer not having to rebuild my whole systems for just
    ## installing packages. I might change my mind later though.
    homeConfigurations = {
      "vrodriguez@C02GN16H1PG2" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = pkgs.stdenv.isDarwin [./modules/home-manager];
      };
    };
  };
}
