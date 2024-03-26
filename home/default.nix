{ inputs, config, pkgs, vars, ... }:
{
  imports = [
    ./shared
  ];
  term.hello = true;
  hello = true;
}
