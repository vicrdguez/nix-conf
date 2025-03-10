source=${args[--source]}

if [[ -z $source ]]; then
    source="github:vicrdguez/flake-templates"
fi

nix flake show "${source}"
