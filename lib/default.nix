{ lib
, inputs
, vars
, ...
}:
rec {
  isDarwin = system: lib.hasSuffix "darwin" system;
  # forEachSys = func: lib.genAttrs vars.allSystems (system: func pkgsFor.${system});
  # forEachSystem = f: lib.genAttrs [ "x86_64-darwin" ] (system: f pkgsFor.${system});
  # forEachDarwinSys = func: lib.genAttrs vars.darwinSystems (system:
  #   func pkgsFor.${system} system);
  # forEachLinuxSys = func: lib.genAttrs vars.linuxSystems (system: func pkgsFor.${system} system);

  mkMacosSystem = pkgs:
    inputs.darwin.lib.darwinSystem
      {
        inherit pkgs;
        system = pkgs.system;
        modules = [
          ../os/darwin.nix
          ./vars
        ];
        specialArgs = {
          inherit vars;
        };
      };

  mkHome = pkgs:
    let
      sharedModules = ../home/shared;
      darwin = isDarwin pkgs.system;
      sysModules = ../home/${ if darwin then "darwin" else "nixos" };
      hmFunc = inputs.home-manager.lib.homeManagerConfiguration;
    in
    hmFunc {
      inherit pkgs;
      modules = [
        sharedModules
        sysModules
        ./vars
      ];
      extraSpecialArgs = {
        inherit vars;
        inherit darwin;
      };
    };

  # lak = field: list: builtins.listToAttrs ( map ( v: { name = v.${field}; value = v;  } ) list );
  # experiment to simplify home manager config to a list
  # mkConf = pkgs: hosts:
  #   let
  #     vars = (lib.evalModules { modules = [ ./vars ]; }).config;
  #     sharedModules = ../home/shared;
  #     darwin = isDarwin pkgs.system;
  #     sysModules = ../home/${ if darwin then "darwin" else "nixos" };
  #     hmFunc = inputs.home-manager.lib.homeManagerConfiguration;
  #   in
  #   builtins.listToAttrs
  #     (map
  #       (host: {
  #         # user@host
  #         name = "${vars.user.name}@${host}";
  #         # home-manager config for user and host
  #         value = hmFunc {
  #           inherit pkgs;
  #           modules = [
  #             sharedModules
  #             sysModules
  #             ./vars
  #           ];
  #           extraSpecialArgs = {
  #             inherit vars;
  #           };
  #         };
  #       })
  #       hosts);

  forEachHost = list: builtins.listToAttrs (map
    (v: {
      name = "";
      value = "";
    })
    list);

  mkConfigurations = { user, host }:
    confList:
    lib.foldAttrs
      # Fold each config with the accumulator
      (acc: conf: _: lib.recursiveUpdate acc conf)
      { darwinConfigurations = { }; homeConfigurarions = { }; }
      confList;

}
