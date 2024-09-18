# vim: set ft=make

default:
    @just --list

# It actually switches, but it is meant for testing new changes in the config.
# Then, once changes are as I please, I use hm-switch to create a final stable commit
hm-build: build
    home-manager switch --flake .

hm-switch: build && switch
    home-manager switch --flake .

# Same stuff but for nix-darwin

[macos]
dw-bootstrap:
    echo 'Installing homebrew'
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
    echo "Setting up nix-darwin"
    nix --extra-experimental-features 'nix-command flakes' run nix-darwin -- switch --flake . 
    # darwin-rebuild switch --flake .
    echo "Setting up home-manager"
    nix run home-manager/master -- switch --flake .
    # home-manager switch --flake .

[macos]
dw-build: build
    darwin-rebuild switch --flake .

[macos]
dw-switch: && switch
    darwin-rebuild switch --flake .

build-all: build
    home-manager switch --flake .
    darwin-rebuild switch --flake .

switch-all: && switch
    home-manager switch --flake .
    darwin-rebuild switch --flake .

build:
    -@git switch -c tmp &>/dev/null
    git add --all
    -git commit -m "build: {{uuid()}}"

switch:
    git reset --soft main
    git commit -e
    git switch main
    git rebase tmp
    git branch -D tmp
    git push

update input:
    nix flake lock --update-input {{input}}

update-all:
    nix flake update

