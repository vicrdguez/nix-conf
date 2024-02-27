rec {
  user = "vrodriguez";
  fullName = "Victor Rodriguez";
  email = "contact@vicrodriguez.dev";

  darwinSystems = [
    "x86_64-darwin"
  ];
  linuxSystems = [ ];

  allSystems = darwinSystems ++ linuxSystems;
}
