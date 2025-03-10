source=${args[--source]}

if [[ -z $source ]]; then
    source="github:vicrdguez/flake-templates"
fi

template=${args[template]}

nix flake init -t "${source}#${template}"
